class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :schedule, null:false, foreign_key: true
      t.references :sheet, null:false, foreign_key: true
      t.date "date" , null: false
      t.string "email" ,null: false, COMMENT: '予約者メールアドレス'
      t.string "name",null: false, :limit =>50 , COMMENT: '予約者名'

      t.timestamps
    end
    add_index :reservations, [:date, :schedule_id, :sheet_id], unique: true
  end
end
