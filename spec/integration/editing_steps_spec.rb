require 'spec_helper'

feature "Editing steps" do
  let!(:topic) { Factory(:topic) }
  let!(:step) { Factory(:step, topic: topic) }

  before do
    visit '/'
    click_link topic.subject
    click_link step.description
    click_link "Edit Step"
  end

  scenario "Updating a step" do
    fill_in "Description", with: "Second thing"
    click_button "Update Step"
    page.should have_content "Step has been updated"
    within("#step h2") do
      page.should have_content("Second thing")
    end
    page.should_not have_content step.description
  end

  scenario "Updating a step with invalid information" do
    fill_in "Description", with: ""
    click_button "Update Step"
    page.should have_content("Step has not been updated.")
  end
end
