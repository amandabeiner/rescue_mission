require 'rails_helper'

feature "user edits a question" do
  let!(:question) {FactoryGirl.create(:question)}
  before(:each) do
    visit question_path(question)
    click_on "Edit Question"
  end
  scenario "user submits valid information on edit page" do

    # # question = Question.create(title: "Here is a question. Here are some more characters. You need forty of those, right?", details: "Here are like a huge ton of characters. I don't know why you need so many characters for a question. What if I just wanted to ask how you're doing? That doesn't take 150 characters. Seems like it's not cut out for being a friendly form, huh?")
    #
    # visit question_path(question)
    #
    # click_on "Edit Question"

    fill_in "Title", with: "Here is a new title for my question. I still don't really have anything to ask."
    fill_in "Details", with: "Here are even more characters. How are ya? I'm still going to ask you even though they want me to not be friendly. So here are more characters up to 150. la la la la la la la la la la la la la la la la"

    click_on "Submit Question"

    expect(page).to have_content("Question saved")
    expect(page).to have_content("Here is a new title for my question. I still don't really have anything to ask.")
    expect(page).to have_content("Here are even more characters. How are ya? I'm still going to ask you even though they want me to not be friendly. So here are more characters up to 150. la la la la la la la la la la la la la la la la")
    expect(page).not_to have_content(question.title)
    expect(page).not_to have_content(question.details)

  end

  scenario "user submits a question with a title that is too short" do
    fill_in "Title", with: "boop"
    fill_in "Details", with: ("Here are even more characters. How are ya? I'm still going to ask you even though they want me to not be friendly. So here are more characters up to 150. la la la la la la la la la la la la la la la la")
    click_on "Submit Question"
    expect(page).to have_content("Invalid input")
  end

  scenario "user submits a question with details that are too short" do
    fill_in "Title", with: "FORTY CHARACTER TITLE RAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAR"
    fill_in "Details", with: "boop"
    click_on "Submit Question"

    expect(page).to have_content("Invalid input")
  end


end
