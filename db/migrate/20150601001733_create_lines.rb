class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :color
      t.string :direction

      t.timestamps null: false
    end
  end
end
