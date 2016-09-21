require 'rails_helper'

feature "user posts a question" do
let!(:question) {FactoryGirl.build(:question)}

  scenario "user submits a valid question" do

    visit new_question_path
    fill_in "Title", with: question.title
    fill_in "Details", with: question.details
    click_button "Submit Question"

    expect(page).to have_content("Question successfully posted")
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.details)
  end

  scenario "user's title isn't long enough" do

    visit new_question_path
    fill_in "Title", with: "Wut."
    fill_in "Details", with: "One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like ba"
    click_on "Submit Question"

    expect(page).to have_content("Invalid input")
  end

  scenario "user's details aren't long enough" do

    visit new_question_path
    fill_in "Title", with: "Sed ut perspiciatis unde omnis iste natu"
    fill_in "Details", with: "What's Ruby?"
    click_on "Submit Question"

    expect(page).to have_content("Invalid input")
  end

  scenario "user submits empty form" do

    visit new_question_path
    click_on "Submit Question"

    expect(page).to have_content("Invalid input")

  end
end
