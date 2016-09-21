require 'factory_girl_rails'


FactoryGirl.define do

  factory :question do
    sequence(:title) { |n| "Far far away, behind the word mountains, #{n}" }
    sequence(:details) {|n| "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feeeeeee #{n}"}
    # user
  end

  factory :user do
    sequence(:username) {|n| "AdultWithMoney#{n}"}
  end

  factory :answer do
    sequence(:description) {|n| "Lorem ipsum dolor sit amet, consectetuer adipiscin  #{n}"}
    # user
    question
  end
end
