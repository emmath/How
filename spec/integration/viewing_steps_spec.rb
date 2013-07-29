require 'spec_helper'

feature "Viewing Steps" do
  before do
    why_the_why = Factory(:topic, subject: "Why the why")
    Factory(:step, topic: why_the_why, description: "Begin with why")

    how_to = Factory(:topic, subject: "How to")
    Factory(:step, topic: how_to, description: "First thing")

    visit '/'
  end

  scenario "Viewing steps for a given topic" do
    click_link "Why the why"
    page.should have_content("Begin with why")
    page.should_not have_content("First thing")

    click_link "Begin with why"
    within("#step h2") do
      page.should have_content("Begin with why")
    end
  end
end
