require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe "index" do
    it "lists all users" do
      users = FactoryGirl.create_list(:user, 3)
      visit  users_path(auth_token: users.first.auth_token)
      users.each do |user|
        expect(page).to have_content user.email
      end
    end
  end

  describe "show user" do
    it "shows user attributes" do
      user = FactoryGirl.create(:user)
      visit user_path(user, auth_token: user.auth_token)
      %w(email firstname lastname).each do |attribute|
        expect(page).to have_content user.send(attribute)
      end
    end
  end

  describe "new user" do
    it "allows user to create account" do
      user_attributes = FactoryGirl.attributes_for(:user)
      visit new_user_path
      fill_in "Email", with: user_attributes[:email]
      fill_in "First name", with: user_attributes[:firstname]
      fill_in "Last name", with: user_attributes[:lastname]
      expect {
        click_button 'Create User'
        }.to change(User, :count).by(1)
    end
  end

  describe "edit user" do
    it "allows user to edit attributes" do
      user = FactoryGirl.create(:user)
      visit edit_user_path(user, auth_token: user.auth_token)
      fill_in "First name", with: "new_first_name"
      expect {
        click_button 'Update User'
        }.not_to change(User, :count)
      user.reload
      expect(user.firstname).to eq "new_first_name"
    end
  end
end
