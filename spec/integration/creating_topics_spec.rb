require 'spec_helper'

feature 'Creating Topics' do
  before do
     visit '/'
    click_link 'New Topic'
  end

  scenario "can create a topic" do
    fill_in 'Subject', with: 'Why the why'
    click_button 'Create Topic'
    page.should have_content('Topic has been created.')

    topic = Topic.find_by_subject("Why the why")
    page.current_url.should == topic_url(topic)
    title = "Why the why - Topics - How"
    find("title").should have_content(title)
  end

  scenario "can not create a topic without a subject" do
    click_button 'Create Topic'
    page.should have_content("Topic has not been created.")
    page.should have_content("Subject can't be blank")
  end
end
