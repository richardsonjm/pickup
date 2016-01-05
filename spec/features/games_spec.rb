require 'rails_helper'

RSpec.describe "Games", type: :feature do
  before { @user = FactoryGirl.create(:user) }

  describe "index" do
    it "list all games" do
      games = FactoryGirl.create_list(:game, 3)
      visit games_path(auth_token: @user.auth_token)
      games.each do |game|
        expect(page).to have_content game.name
      end
    end
  end

  describe "show" do
    it "shows game attributes" do
      game = FactoryGirl.create(:game)
      visit game_path(game, auth_token: @user.auth_token)
      %w(name description).each do |attribute|
        expect(page).to have_content game.send(attribute)
      end
      expect(page).to have_content game.user.email
    end
  end

  describe "new" do
    it "allows user to create new game" do
      game_attributes = FactoryGirl.attributes_for(:game)
      visit new_game_path(auth_token: @user.auth_token)
      fill_in "Name", with: game_attributes[:name]
      fill_in "Description", with: game_attributes[:description]
      expect {
        click_button 'Create Game'
        }.to change(Game, :count).by(1)
    end
  end

  describe "edit" do
    it "allows user to edit game attributes" do
      game = FactoryGirl.create(:game, user: @user)
      visit edit_game_path(game, auth_token: @user.auth_token)
      fill_in "Name", with: "new_name"
      expect {
        click_button 'Update Game'
        }.not_to change(Game, :count)
      game.reload
      expect(game.name).to eq "new_name"
    end
  end
end
