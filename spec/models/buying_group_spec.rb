require 'rails_helper'

describe BuyingGroup do

  let(:buying_group) do
    BuyingGroup.new(cost: 25000, max_members: 5, hangar_fee: 300,
      annual_inspection_cost: 1200,
      annual_insurance_cost: 1200,
      gallons_per_hour: 5,
      price_per_gallon: 5,
      tboh: 2000,
      engine_time: 1000,
      overhaul_cost: 25000,
      hourly_maintenance_reserve: 10,
    )
  end

  describe "initial_investment" do
    it "splits cost per member" do
      expect(buying_group.initial_investment).to eq(5000)
    end
  end

  describe "fixed_monthly" do
    it "calculates monthly per member costs" do
      expect(buying_group.fixed_monthly).to eq(100)
    end
  end

  describe "hourly" do
    it "calculates monthly per member costs" do
      expect(buying_group.hourly_rate).to eq(60)
    end
  end

end
