class EditColumnsListingsPrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :price
    add_column :listings, :price_per_day, :string
  end
end