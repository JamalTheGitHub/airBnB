class ChangePriceDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :price_per_day, 'integer USING CAST(price_per_day AS integer)'
  end
end
