class MembershipsController < ApplicationController
  before_action :set_membership, only: [:destroy]
  before_action :check_membership_user, only: [:destroy]

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: 'Membership was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
    end
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
