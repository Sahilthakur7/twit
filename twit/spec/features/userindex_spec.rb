require "rails_helper.rb"

RSpec.feature "All viewers can be seen" do
    let(:user) {FactoryGirl.create(:user)}
    let(:user2) {FactoryGirl.create(:user)}

    before do
        login_as(user)

    end

    scenario "user wants to see signed in users" do
        visit "/"
        click_link "Users"
        expect(page).to have_content "All Users"
        expect(page).to have_content user2.username

    end
end
