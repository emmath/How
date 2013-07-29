require 'spec_helper'

feature "Creating Step" do
  before do
    Factory(:topic, subject: "How to")
    visit '/'
    click_link "How to"
    click_link "New Step"
  end

  scenario "Creating a Step" do
    fill_in "Description", with: "First thing"
    click_button "Create Step"
    page.should have_content("Step has been created.")
  end

  scenario "Creating a step without valid attributes fails" do
    click_button "Create Step"
    fill_in "Description", with: ""
    page.should have_content("Step has not been created.")
    page.should have_content("Description can't be blank")
  end
end

