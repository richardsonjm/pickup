class PagesController < ApplicationController
  skip_before_action :authenticate, only: [:home]

  def home
  end

  def dashboard
  end
end
