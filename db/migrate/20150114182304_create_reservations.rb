class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :user_id, null: false
      t.integer :listing_id, null: false
      t.integer :total_cost, default: 0
    end
  end
end
