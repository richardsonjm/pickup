require 'rails_helper'

RSpec.describe Game, type: :model do
  before { @game = FactoryGirl.build(:game) }

  subject { @game }

  describe "name" do
    it { is_expected.to have_db_column :name }
    it { is_expected.to respond_to :name }

    it { is_expected.not_to allow_value(nil).for(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

    it { is_expected.to normalize_attribute(:name) }
    it { is_expected.to normalize_attribute(:name).from(" name ").to("name") }
  end

  describe "description" do
    it { is_expected.to have_db_column :description }
    it { is_expected.to respond_to :description }

    it { is_expected.not_to allow_value(nil).for(:description) }

    it { is_expected.to normalize_attribute(:description) }
    it { is_expected.to normalize_attribute(:description).from(" description ").to("description") }
  end

  describe "user" do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_index :user_id }
    it { is_expected.to belong_to :user }
    it { is_expected.to respond_to :user }
    it { is_expected.to respond_to :user_id }
  end
end
