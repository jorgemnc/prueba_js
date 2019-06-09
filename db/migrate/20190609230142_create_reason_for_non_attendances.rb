class CreateReasonForNonAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :reason_for_non_attendances do |t|
      t.string :motivo

      t.timestamps
    end
  end
end
