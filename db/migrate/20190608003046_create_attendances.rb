class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :movimiento
      t.date :inicio
      t.date :termino

      t.timestamps
    end
  end
end
