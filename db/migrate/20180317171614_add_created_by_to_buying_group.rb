class AddCreatedByToBuyingGroup < ActiveRecord::Migration
  def change
    add_reference :buying_groups, :created_by, index: true, foreign_key: true
  end
end
