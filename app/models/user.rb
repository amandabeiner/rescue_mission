class User < ActiveRecord::Base
  validates :usersname, presence: true, uniqueness: true

  has_many :questions
  has_many :answers
end
