require 'rails_helper'

feature "user deletes a question" do

  let(:question){FactoryGirl.create(:question)}
  let(:answer){FactoryGirl.create_list(:answer, 5)}

  scenario "user deletes question from the question edit page" do

    visit edit_question_path(question)
    click_on "Delete Question"

    expect(page).not_to have_content(question.title)
    expect(page).not_to have_content(question.details)
    expect(Answer.where(question: question)).to be_empty



  end

  scenario "user deletes question from the question details page" do

    visit question_path(question)
    click_on "Delete Question"

    expect(page).not_to have_content(question.title)
    expect(page).not_to have_content(question.details)
    expect(Answer.where(question: question)).to be_empty
  end
end
