class RenameListingType < ActiveRecord::Migration
  def change
    rename_column :listings, :listing_type, :listing_type_id
  end
end
