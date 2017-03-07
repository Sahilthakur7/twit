require "rails_helper"

RSpec.feature "Users can create microposts" do
    
    let(:user) {FactoryGirl.create(:user)}
    before do
        login_as user
    end

    scenario "User is able to fill in the micropost" do
        visit "/"
        fill_in "Micropost", with: "It feels amazing today"
        click_button "Post"
        click_link "Profile"

        expect(page).to have_content "It feels amazing today"

    end
end
