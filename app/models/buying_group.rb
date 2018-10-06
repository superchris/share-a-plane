class BuyingGroup < ActiveRecord::Base

  belongs_to :created_by, class_name: "User"
  belongs_to :airport

  attr_accessor :home_airport

  acts_as_mappable through: :airport
  
  validate :airport_exists

  validates :annual_inspection_cost, numericality: { greater_than: 0 }
  validates :annual_insurance_cost, numericality: { greater_than: 0 }
  validates :gallons_per_hour, numericality: { greater_than: 0 }
  validates :tboh, numericality: { greater_than: 0 }
  validates :engine_time, numericality: true
  validates :hourly_maintenance_reserve, numericality: true
  validates :hangar_fee, numericality: true
  validates :price_per_gallon, numericality: true
  validates :overhaul_cost, numericality: true
  validates :max_members, numericality: true

  before_validation :assign_airport

  has_many :memberships

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

  def home_airport_code
    home_airport.strip.upcase.gsub(/^K/, "")
  end

  def airport_exists
    unless Airport.find_by_code(home_airport_code)
      errors.add(:home_airport, "Invalid airport")
    end
  end

  def assign_airport
    self.airport = Airport.find_by_code(home_airport_code)
  end

end
