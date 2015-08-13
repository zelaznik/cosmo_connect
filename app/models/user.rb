class User < ActiveRecord::Base

  ####################################
  #    USER REQUIRED DETAILS         #
  ####################################

  validates :birthdate, :gender, presence: true

  ####################################
  #    USER AUTHENTICATION PATTERN   #
  ####################################

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

  has_many :photos
  has_many :matches

  has_one :details, class_name: "DetailsOfUser"
  has_one :ethnicity, through: :details, source: :ethnicity
  has_one :body_type, through: :details, source: :body_type
  has_one :religion, through: :details, source: :religion
  has_one :relationship_status, through: :details, source: :relationship_status

  has_many(
    :secret_admirers,
    through: :matches,
    foreign_key: :receiver_id,
    source: :sender
  )

  has_many(
    :crushes,
    through: :matches,
    foreign_key: :sender_id,
    source: :receiver
  )

  has_many :desired_genders
  has_many :genders_sought, through: :desired_genders, source: :gender
  has_many :users_of_desirable_gender, through: :desired_genders, source: :user

  has_many :visits, foreign_key: :visitor_id
  has_many :visited_profiles, through: :visits, source: :profile
  has_many :visitors, through: :visits, source: :visitor

  has_many :user_interest_links
  has_many :interests, through: :user_interest_links, source: :interest

  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id

  has_many :responses

end
