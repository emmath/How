require 'spec_helper'

feature 'Creating Topics' do
  scenario "can create a topic" do
    visit '/'
    click_link 'New Topic'
    fill_in 'Topic', with: 'Why the why'
    click_button 'Create Topic'
    page.should have_content('Topic has been created.')
  end
end
