class User < ActiveRecord::Base

  ####################################
  #    USER AUTHENTICATION PATTERN   #
  ####################################

  validates :username, uniqueness: true
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(username, password)
    user = self.find_by(username: username)
    (user && user.valid_password?(password)) ? user : nil
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
        desired_genders my_desires ON my_desires.user_id = me.id
      INNER JOIN
        users them ON my_desires.gender_id = them.gender_id
      INNER JOIN
        desired_genders their_desires
        ON their_desires.user_id = them.id
        AND their_desires.gender_id = me.gender_id

      WHERE
        me.id = #{self.id}
        AND my_desires.interested
        AND their_desires.interested
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

  def emails_with(other_user)
    Message.find_by_sql([<<-SQL, self_id: self.id, other_id: other_user.id])
    SELECT
      m.*
    FROM
      messages m
    WHERE
      (m.sender_id = :self_id AND m.receiver_id = :other_id)
      OR (m.sender_id = :other_id AND m.receiver_id = :self_id)
    ORDER BY
      m.created_at
    SQL
  end

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

end
