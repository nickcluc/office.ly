class AddMoreRatingsToReviews < ActiveRecord::Migration
  def up
    rename_column :reviews, :rating, :overall_rating
    add_column :reviews, :amenities_rating, :integer
    add_column :reviews, :cleanliness_rating, :integer
    add_column :reviews, :location_rating, :integer
    add_column :reviews, :company_rating, :integer
  end

  def down
    remove_column :reviews, :amenities_rating, :integer
    remove_column :reviews, :cleanliness_rating, :integer
    remove_column :reviews, :location_rating, :integer
    remove_column :reviews, :company_rating, :integer
  end
end
