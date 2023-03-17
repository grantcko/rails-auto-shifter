class ChangeShiftErrorsToArrayFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :shift_errors, :text, array: true, default: [], using: "shift_errors::text[]"
  end
end
