class AddIndexToListings < ActiveRecord::Migration
  def change
    add_index :listings, [:latitude, :longitude]
  end
end
