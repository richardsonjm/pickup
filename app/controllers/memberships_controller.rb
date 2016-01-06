class MembershipsController < ApplicationController
  before_action :set_membership, only: [:destroy]
  before_action :check_membership_user, only: [:destroy]

  def create
    @membership = Membership.new(membership_params)
    respond_to do |format|
      if @membership.save
        format.js
      else
        format.js { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game = @membership.game
    @membership.destroy
  end

  private

    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:user_id, :game_id)
    end

    def check_membership_user
      redirect_to root_path unless @membership.user == @user
    end
end
