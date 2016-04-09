require 'rails_helper'

feature "create a note", %{

  I want to create a note
  for a meeting.
} do

  # Acceptance Criteria
  #
  # [] I can visit a note "show" page
  #     and see a link to create
  #     a new note
  # [] I see a form
  # [] I can see a success-message

  describe "\n create a new note -->", js: true do
    let!(:meeting) { FactoryGirl.create(:meeting) }

    scenario "scenario: view Pre Note form" do
			visit meetings_path

			click_on meeting.subject
			sleep(1)
			first(".fa-plus-circle").click

			expect(page).to have_css("#pre-notes-form")
    end

    scenario "scenario: view Current Note form" do
			visit meetings_path

			click_on meeting.subject
			sleep(1)
			first(".fa-plus-circle").click

			expect(page).to have_css("#current-notes-form")
    end

    scenario "scenario: view Post Note form" do
			expect(page).to have_css("#post-notes-form")
    end

	  scenario "scenario: submit invalid pre-note form" do
			expect(page).to have_content("Pre-note not created. Try again.")
			expect(page).not_to have_content("Pre Note successfully created!")
    end

	  scenario "scenario: submit valid pre Note form" do
			expect(page).to have_content("Pre Note successfully created!")
			expect(page).not_to have_content("Pre Note not created. Try again.")
    end

	  scenario "scenario: submit invalid current Note form" do
			expect(page).to have_content("Current Note not created. Try again.")
			expect(page).not_to have_content("Current Note successfully created!")
    end

	  scenario "scenario: submit valid current Note form" do
			expect(page).to have_content("Current Note successfully created!")
			expect(page).not_to have_content("Current Note not created. Try again.")
    end

	  scenario "scenario: submit invalid post Note form" do
			expect(page).to have_content("Post Note not created. Try again.")
			expect(page).not_to have_content("Post Note successfully created!")
    end

	  scenario "scenario: submit valid post Note form" do
			expect(page).to have_content("Post Note successfully created!")
			expect(page).not_to have_content("Post Note not created. Try again.")
    end
	end
end
