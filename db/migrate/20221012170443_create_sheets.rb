class CreateSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :sheets do |t|
      t.bigint "column", null: false
      t.string "row", limit: 1, null: false

      t.timestamps
    end
  end
end
