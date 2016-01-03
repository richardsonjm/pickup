require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #home" do
      expect(:get => "/home").to route_to("pages#home")
    end

    it "routes to #dashboard" do
      expect(:get => "/dashboard").to route_to("pages#dashboard")
    end
  end
end
