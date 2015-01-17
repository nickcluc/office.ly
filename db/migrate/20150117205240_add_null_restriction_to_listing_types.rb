class AddNullRestrictionToListingTypes < ActiveRecord::Migration
  def change
    change_column :listings, :listing_type_id, :integer, null: false
  end
end
