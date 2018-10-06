class MembershipsController < ApplicationController

  before_action :authenticate_user!

  def create
    @buying_group = BuyingGroup.find(params[:buying_group_id])
    @buying_group.memberships.create!(user: current_user)
    redirect_to @buying_group
  end
end
