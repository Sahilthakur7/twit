require "rails_helper"

RSpec.feature "User can change the account settings " do
    let (:user) { FactoryGirl.create(:user) }
    before do
        login_as(user)
    
    visit "/"
    click_link "Settings"
    end

    scenario "user changes his username" do
        fill_in "Username", with: "change"
        fill_in "Current password", with: "password"
        click_button "Update"
        expect(page).to have_content "Your account has been updated successfully."
    end


end
