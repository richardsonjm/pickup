require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #home" do
    it "assigns all users as @users" do
      get :home
      expect(response).to be_success
      expect(response).to render_template :home
    end
  end

  describe "GET #home" do
    it "assigns all users as @users" do
      user = FactoryGirl.create(:user)
      get :dashboard, auth_token: user.auth_token
      expect(response).to be_success
      expect(response).to render_template :dashboard
    end
  end
end
