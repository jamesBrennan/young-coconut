require "rails_helper"

feature "Starting a new workout" do
  scenario "User visits the home page", js: true do
    visit "/"
    expect(page).to have_text "Start"
  end
end
