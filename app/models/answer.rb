class Answer < ActiveRecord::Base
  validates :description, presence: true, length: {minimum: 50 }
  validates :user_id, presence: true
  validates :question_id, presence: true

  belongs_to :user
  belongs_to :question 
end
