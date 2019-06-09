class AddReasonForNonAttendanceToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :reason_for_non_attendance, foreign_key: true
  end
end
