class BuyingGroupsController < ApplicationController
  before_action :set_buying_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit]

  # GET /buying_groups
  # GET /buying_groups.json
  def index
    if params[:zipcode].present?
      @buying_groups = BuyingGroup.near_zipcode(params[:zipcode])
    elsif params[:airport_code].present?
      @buying_groups = BuyingGroup.near_airport(params[:airport_code])
    else
      @buying_groups = BuyingGroup.all
    end
  end

  # GET /buying_groups/1
  # GET /buying_groups/1.json
  def show
    @membership = Membership.new
  end

  # GET /buying_groups/new
  def new
    @buying_group = BuyingGroup.new
  end

  # GET /buying_groups/1/edit
  def edit
    @buying_group.home_airport = @buying_group.airport.code
  end

  # POST /buying_groups
  # POST /buying_groups.json
  def create
    @buying_group = BuyingGroup.new(buying_group_params)
    @buying_group.created_by = current_user

    respond_to do |format|
      if @buying_group.save
        format.html { redirect_to @buying_group, notice: 'Buying group was successfully created.' }
        format.json { render :show, status: :created, location: @buying_group }
      else
        format.html { render :new }
        format.json { render json: @buying_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buying_groups/1
  # PATCH/PUT /buying_groups/1.json
  def update
    respond_to do |format|
      if @buying_group.update(buying_group_params)
        format.html { redirect_to @buying_group, notice: 'Buying group was successfully updated.' }
        format.json { render :show, status: :ok, location: @buying_group }
      else
        format.html { render :edit }
        format.json { render json: @buying_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buying_groups/1
  # DELETE /buying_groups/1.json
  def destroy
    @buying_group.destroy
    respond_to do |format|
      format.html { redirect_to buying_groups_url, notice: 'Buying group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buying_group
      @buying_group = BuyingGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buying_group_params
      params.require(:buying_group).permit(:cost, :aircraft_type, :engine_time,
        :tboh, :hangar_fee, :annual_insurance_cost, :annual_inspection_cost,
        :max_members, :overhaul_cost, :home_airport, :hourly_maintenance_reserve,
        :gallons_per_hour, :price_per_gallon
      )
    end
end
