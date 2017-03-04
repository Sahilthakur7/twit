require "rails_helper"

RSpec.feature "Users with an account see" do
    let(:user) { FactoryGirl.create(:user) }
    before do
        login_as(user)
    end

        scenario "when user clicks the link profile" do
            visit "/"
            click_link "Profile"
            expect(page).to have_content "Username:"
            
        end
    end
