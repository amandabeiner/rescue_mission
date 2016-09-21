require 'rails_helper'

feature "user posts an answer" do
  let!(:question){FactoryGirl.create(:question)}
  let!(:answer){FactoryGirl.create(:answer)}

  scenario "user submits a valid answer" do
    visit question_path(question)
    fill_in "Description", with: answer.description
    click_button "Answer Question"

    expect(page).to have_content("Answer successfully posted")
    expect(page).to have_content(answer.description)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.details)
  end

  scenario "user submits an invalid answer" do
    visit question_path(question)
    fill_in "Description", with: "sux 2 suck"
    click_button "Answer Question"

    expect(page).to have_content("Invalid input")
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.details)
  end
end
