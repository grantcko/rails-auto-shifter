class AddShiftErrorsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :shift_errors, :string, hash: true
  end
end
