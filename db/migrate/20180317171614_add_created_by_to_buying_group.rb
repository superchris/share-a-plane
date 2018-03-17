class AddCreatedByToBuyingGroup < ActiveRecord::Migration[5.1]
  def change
    add_reference :buying_groups, :created_by, foreign_key: {to_table: :users}
  end
end
