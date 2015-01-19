class RemoveDefaultFromListingType < ActiveRecord::Migration
  def change
    remove_column :listings, :listing_type_id
    add_column :listings, :listing_type_id, :integer
  end
end
