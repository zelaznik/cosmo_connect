class User < ActiveRecord::Base

  ####################################
  #    USER AUTHENTICATION PATTERN   #
  ####################################

  validates :username, uniqueness: true
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token
  validate :username_lowercase
  attr_reader :password

  def self.find_by_credentials(username, password)
    user = self.find_by(username: username)
    (user && user.valid_password?(password)) ? user : nil
  end

  ## For indicating to Backbone
  ## Whether to disply the modal forms
  ## for a user's first time logging in
  def first_time_user=(value)
    @first_time_user = !!value
  end

  def first_time_user
    !!@first_time_user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = new_token
  end

  private
  def ensure_session_token
    self.session_token ||= new_token
  end

  def new_token
    SecureRandom.urlsafe_base64(16)
  end

  ####################################
  #     ActiveRecord Associations    #
  ####################################

  public
  belongs_to :gender

  has_many :photos, dependent: :destroy

  has_one :details, class_name: "DetailsOfUser", dependent: :destroy
  has_one :ethnicity, through: :details, source: :ethnicity
  has_one :body_type, through: :details, source: :body_type
  has_one :religion, through: :details, source: :religion
  has_one :relationship_status, through: :details, source: :relationship_status

  has_many :crush_matches, class_name: "Match", foreign_key: :sender_id
  has_many :admirer_matches, class_name: "Match", foreign_key: :receiver_id

  has_many(
    :secret_admirers,
    through: :admirer_matches,
    source: :sender
  )

   has_many(
    :crushes,
    through: :crush_matches,
    source: :receiver
  )

  # has_many :soulmates, through: :crush_matches, source: :mutual_users

  def emails_with(other_user)
    Message.where(
      "(sender_id = ? AND receiver_id = ?)
      OR (receiver_id = ? AND sender_id = ?)",
      other_user.id, self.id, other_user.id, self.id)
     .order(:created_at)
  end

  def soulmates
    # Use a subquery to get the unique ids of the soulmates
    # Then put it into a plain old ActiveRecord associaton
    User.where("id IN (
      SELECT
        them.id
      FROM
        users you
      INNER JOIN
        matches m0 ON m0.sender_id = you.id
      INNER JOIN
        matches m1 ON m1.sender_id = m0.receiver_id
        AND m1.receiver_id = #{self.id}
      INNER JOIN
        users them ON m1.sender_id = them.id
      WHERE
        you.id = #{self.id}
    )")
  end

  def matches_by_orientation
    User.where("id IN (
      SELECT
        them.id

      FROM
        users me
      INNER JOIN
        desired_genders my_preferences ON my_preferences.user_id = me.id
      INNER JOIN
        desired_genders their_preferences ON their_preferences.gender_id = me.gender_id
      INNER JOIN
        users them
        ON my_preferences.gender_id = them.gender_id
        AND their_preferences.user_id = them.id

      WHERE
        me.id = #{self.id}
        AND my_preferences.interested
        AND their_preferences.interested
    )")
  end

  has_many :desired_genders, dependent: :destroy
  has_many :genders_sought, through: :desired_genders, source: :gender
  has_many :users_of_desirable_gender, through: :desired_genders, source: :user

  has_many :visit_history, class_name: "Visit", foreign_key: :visitor_id
  has_many :visited_profiles, through: :visit_history, source: :profile

  has_many :received_visits, class_name: "Visit", foreign_key: :profile_id
  has_many :visitors, through: :received_visits, source: :visitor

  has_many :user_interest_links, dependent: :destroy
  has_many :interests, through: :user_interest_links, source: :interest

  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id

  has_many :responses, dependent: :destroy

  ####################################
  #    On The Fly Calculations       #
  ####################################

  def age
    # Source http://stackoverflow.com/questions/819263/get-persons-age-in-ruby
    return nil if birthdate.nil?
    now = Time.now.utc.to_date
    now.year - birthdate.year - (birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def has_crush_on(other_user)
    !!crush_hash[other_user.id]
  end

  def get_like_object(other_user)
    crush_match_hash[other_user.id] || false
  end

  private
  def crush_hash
    @crush_hash ||= Hash[crushes.collect { |crush| [crush.id, crush] } ]
  end

  def crush_match_hash
    @crush_match_hash ||= Hash[crush_matches.collect { |m| [m.receiver_id, m] } ]
  end

  def preferences
    prefs = DesiredGender.where(user: self, interested: true).includes(:gender)
    (prefs.map {|p| p.plural}).join(', ')
  end

  ####################################
  #    Custom Validations            #
  ####################################

  def username_lowercase
    if username != username.downcase
      errors.add :base, "username needs to be lowercase"
    end
  end

  ####################################
  #    For JSON Rendering            #
  ####################################

  def json_preview(current_user)
    data = {id: id, username: username, age: age, photo: photo.url, preferences: preferences}
    data[:is_liked] = !!Match.where(sender: current_user, receiver: self).first unless current_user == self
    data
  end

end
