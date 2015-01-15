class ChangeListingsRate < ActiveRecord::Migration
  def change
    remove_column :listings, :rate_cents
    add_column :listings, :weekly_rate, :integer
  end
end
