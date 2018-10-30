class AddReferenceListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :user, index:true
  end
end