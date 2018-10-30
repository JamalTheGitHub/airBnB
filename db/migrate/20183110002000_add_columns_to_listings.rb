class AddColumnsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :description, :string
    add_column :listings, :amenities, :string
    add_column :listings, :guests, :integer
    add_column :listings, :bedrooms, :string
    add_column :listings, :beds, :string
    add_column :listings, :sleeping_arrangements, :string
    add_column :listings, :baths, :string
  end
end