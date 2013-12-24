class Feedback < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :giver_email, presence: true
end
