require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  describe "email" do
    it { is_expected.to have_db_column(:email).with_options(null: false) }
    it { is_expected.to respond_to :email }
    it { is_expected.to have_db_index(:email).unique(true) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to normalize_attribute(:email) }
    it { is_expected.to normalize_attribute(:email).from(" user@example ").to("user@example") }

    context "when already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.save
      end
      it { is_expected.not_to be_valid }
    end

    context "when already taken regardless of case" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end
      it { is_expected.not_to be_valid }
    end

    context "format" do
      context "should not be valid without @ sign" do
        before { @user.email = "userexample.com" }
        it { is_expected.not_to be_valid }
      end

      context "should not be valid without terminal domain" do
        before { @user.email = "user@example" }
        it { is_expected.not_to be_valid }
      end
    end
  end

  describe "firstname" do
    it { is_expected.to have_db_column(:firstname) }
    it { is_expected.to respond_to :firstname }
  end

  describe "lastname" do
    it { is_expected.to have_db_column(:lastname) }
    it { is_expected.to respond_to :lastname }
  end

  describe "auth_token" do
    it { is_expected.to have_db_column :auth_token }
    it { is_expected.to respond_to :auth_token }

    it { is_expected.not_to allow_value(nil).for(:auth_token) }
    it { is_expected.not_to allow_value(' ').for(:auth_token) }
    it { is_expected.to validate_uniqueness_of(:auth_token) }

    it "doesn't change on save" do
      expect {
        @user.save
      }.not_to change(@user, :auth_token)
    end

    it "can be updated on save" do
      expect {
        @user.auth_token = 'new_token'
        @user.save
      }.to change(@user, :auth_token).to 'new_token'
    end

    it "can be updated on update" do
      expect {
        @user.update(auth_token: 'new_token')
      }.to change(@user, :auth_token).to 'new_token'
    end

    it "generates a token if token is nil" do
      user = FactoryGirl.build(:user, auth_token: nil)
      expect(@user.valid?).to be true
      expect(@user.blank?).to be false
    end

    it "generates a token if token is blank" do
      user = FactoryGirl.build(:user, auth_token: '')
      expect(@user.valid?).to be true
      expect(@user.blank?).to be false
    end
  end
end
