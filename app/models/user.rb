class User < ActiveRecord::Base
  has_many :feedbacks, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  before_create :create_feedback_request_key
  
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
    
    def create_feedback_request_key
      # generate request key
      self.feedback_request_key = SecureRandom.urlsafe_base64(n = 6)
      
      # check if there is another person with the same key if not, try again
      while(!User.where(feedback_request_key: feedback_request_key).empty?)
        self.feedback_request_key = SecureRandom.urlsafe_base64(n = 6)
      end
    end
end