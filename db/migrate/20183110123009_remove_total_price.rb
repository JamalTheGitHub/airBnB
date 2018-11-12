class RemoveTotalPrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :total_price
  end
end
