class ChangeCreatedByToUserId < ActiveRecord::Migration
  def change
    rename_column :listings, :created_by, :user_id
  end
end
