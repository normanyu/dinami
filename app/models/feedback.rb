class Feedback < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :giver_email,   presence:   true,
                            format:     { with: VALID_EMAIL_REGEX }
                    
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
