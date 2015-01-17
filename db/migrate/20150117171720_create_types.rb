class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :title, null: false
      t.text :description, null: false
    end
    add_column :listings, :type, :integer, default: 1, null: false
  end
end
