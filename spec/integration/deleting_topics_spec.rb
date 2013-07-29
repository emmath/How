require 'spec_helper'

feature 'Deleting topics' do
  scenario "Deleting a topic" do
    Factory(:topic, subject: "Why the why")
    visit '/'
    click_link "Why the why"
    click_link "Delete Topic"
    page.should have_content("Topic has been deleted.")

    visit '/'
    page.should_not have_content("Why the why")
  end
end
