class CreateListingAmenities < ActiveRecord::Migration
  def change
    create_table :listing_amenities do |t|
      t.integer :listing_id, null: false
      t.integer :amenity_id, null: false
    end
  end
end
