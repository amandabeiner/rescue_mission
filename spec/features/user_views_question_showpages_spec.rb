require 'rails_helper'

feature 'user sees question details on a show page' do
  let!(:question) {FactoryGirl.create(:question)}

  scenario 'user visits showpage' do
    visit '/questions'

    click_link question.title

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.details)

  end
end
