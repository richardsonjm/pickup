require 'rails_helper'

RSpec.feature "Pages", type: :feature, js: true do
  before { @user = FactoryGirl.create(:user) }

  describe "Home" do
    it "Allows user to authenticate" do
      visit home_path
      fill_in "Enter code", with: @user.auth_token
      loop until page.evaluate_script('jQuery.active').zero?
      submit = find('.auth-token-submit')
      expect(submit['href']).to include @user.auth_token
      submit.click
      expect(page).to have_content @user.email
      expect(current_path).to eq dashboard_path
    end
  end

  describe "Dashboard" do
    it "Shows information about user pickups" do
      visit  dashboard_path(auth_token: @user.auth_token)
      expect(page).to have_content @user.email
    end
  end
end
