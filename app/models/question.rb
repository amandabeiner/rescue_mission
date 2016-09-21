class Question < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, length: {minimum: 40}
  validates :details, presence: true, length: {minimum: 150}
  # validates :user_id, presence: true

  # belongs_to :user
  has_many :answers

end
