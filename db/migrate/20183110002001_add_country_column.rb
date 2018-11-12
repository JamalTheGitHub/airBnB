class AddCountryColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :country, :string
  end
end
