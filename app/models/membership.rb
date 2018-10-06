class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :buying_group
end
