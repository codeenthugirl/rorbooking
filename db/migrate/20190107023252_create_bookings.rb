class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :seat
      t.date :fromdate
      t.date :todate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
