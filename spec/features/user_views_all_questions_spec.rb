require 'rails_helper'

feature "views a list of questions" do
  let!(:questions) {FactoryGirl.create_list(:question, 10)}

  scenario "visits the question page" do

    visit '/questions'

    questions.each do |question|
      expect(page).to have_link(question.title)
    end
  end
end
