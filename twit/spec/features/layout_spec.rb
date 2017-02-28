require "rails_helper"

RSpec.feature "When opened the home page" do
    scenario "home page opened" do
        visit "/"

        expect(page).to have_content "Home"
        expect(page).to have_content "About"
        expect(page).to have_content "Settings"
            
        expect(page).to have_content "Help"
    end

    scenario "links on the homepage clicked" do
        visit "/"

        click_link "Contact"
        expect(page).to have_content "sahilrd07@gmail.com"
    end
end
