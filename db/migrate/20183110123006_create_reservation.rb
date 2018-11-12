class CreateReservation < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.timestamps null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :listing, foreign_key: true
    end
  end
end
