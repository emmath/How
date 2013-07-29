require 'spec_helper'

feature "Editing Topics" do
  before do
    Factory(:topic, subject: "Why the why")
    visit '/'
    click_link "Why the why"
    click_link "Edit Topic"
  end

    scenario "Updating a topic" do
    fill_in "Subject", with: "Why the why beta"
    click_button "Update Topic"
    page.should have_content("Topic has been updated")
  end

  scenario "Updating a topic with invalid attributes doesn't work" do
    fill_in "Subject", with: ""
    click_button "Update Topic"
    page.should have_content("Topic has not been updated.")
  end
end
