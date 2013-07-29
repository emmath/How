require 'spec_helper'

feature "Viewing topics" do
  scenario "Listing all topics" do
    topic = Factory.create(:topic, subject: "Why the why")
    visit '/'
    click_link 'Why the why'
    page.current_url.should == topic_url(topic)
  end
end
