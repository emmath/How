require 'spec_helper'

feature 'Deleting steps' do
  let!(:topic) { Factory(:topic) }
  let!(:step) { Factory(:step, :topic => topic) }
  before do
    visit '/'
    click_link topic.subject
    click_link step.description
  end

  scenario "Deleting a step" do
    click_link "Delete Step"
    page.should have_content("Step has been deleted.")
    page.current_url.should == topic_url(topic)
  end
end
