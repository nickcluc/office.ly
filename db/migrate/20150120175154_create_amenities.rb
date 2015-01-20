class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :font_awesome_image, null: false
    end
  end
end
