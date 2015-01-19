class RenameType < ActiveRecord::Migration
  def change
    rename_table :types, :listing_types
  end
end
