require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before do
    @user = FactoryGirl.create(:user)
    valid_session(@user)
    @game = FactoryGirl.create(:game, user: @user)
  end

  let(:valid_attributes) {
    {name: "Basketball", description: "coed, no kids" }
  }

  let(:invalid_attributes) {
    {name: "" }
  }

  describe "filters" do
    it { is_expected.to use_before_action(:authenticate) }
    it { is_expected.to use_before_action(:check_game_user) }
  end

  describe "GET #index" do
    it "assigns all games as @games" do
      get :index, {}
      expect(assigns(:games)).to eq([@game])
    end
  end

  describe "GET #show" do
    it "assigns the requested game as @game" do
      get :show, {:id => @game.to_param}
      expect(assigns(:game)).to eq(@game)
    end
  end

  describe "GET #new" do
    it "assigns a new game as @game" do
      get :new, {}
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "GET #edit" do
    it "assigns the requested game as @game" do
      get :edit, {:id => @game.to_param}
      expect(assigns(:game)).to eq(@game)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Game" do
        expect {
          post :create, {:game => valid_attributes}
        }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, {:game => valid_attributes}
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, {:game => valid_attributes}
        expect(response).to redirect_to(Game.last)
      end

      it "assigns @user to game user" do
        post :create, {:game => valid_attributes}
        expect(Game.last.user).to eq @user
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved game as @game" do
        post :create, {:game => invalid_attributes}
        expect(assigns(:game)).to be_a_new(Game)
      end

      it "re-renders the 'new' template" do
        post :create, {:game => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge(description: 'ok, kids can come')
      }

      it "updates the requested game" do
        put :update, {:id => @game.to_param, :game => new_attributes}
        @game.reload
        expect(@game.description).to eq 'ok, kids can come'
      end

      it "assigns the requested game as @game" do
        put :update, {:id => @game.to_param, :game => valid_attributes}
        expect(assigns(:game)).to eq(@game)
      end

      it "redirects to the game" do
        put :update, {:id => @game.to_param, :game => valid_attributes}
        expect(response).to redirect_to(@game)
      end
    end

    context "with invalid params" do
      it "assigns the game as @game" do
        put :update, {:id => @game.to_param, :game => invalid_attributes}
        expect(assigns(:game)).to eq(@game)
      end

      it "re-renders the 'edit' template" do

        put :update, {:id => @game.to_param, :game => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested game" do
      expect {
        delete :destroy, {:id => @game.to_param}
      }.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      delete :destroy, {:id => @game.to_param}
      expect(response).to redirect_to(games_url)
    end
  end

end
