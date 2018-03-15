class BuyingGroup < ActiveRecord::Base

  def initial_investment
    cost / max_members
  end

  def fixed_monthly
    (((annual_insurance_cost + annual_inspection_cost) / 12) + hangar_fee) / max_members
  end

  def hourly_rate
    (overhaul_cost / (tboh - engine_time)) +
    (gallons_per_hour * price_per_gallon) +
    hourly_maintenance_reserve
  end
end
