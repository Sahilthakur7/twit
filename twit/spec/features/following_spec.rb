require "rails_helper"

RSpec.feature "users can follow each other" do

    scenario "user tries to follow" do
        let(:user) { FactoryGirl.create(:user) }
        let(:user2) { FactoryGirl.create(:user2) }

        before do
            login_as user

        end
        visit "/"
        click_link "Users"
        click_link "user2.username"
        click_link "Follow"

        expect(page).to have_content "You are following #{user2.username} now"
    end
end
