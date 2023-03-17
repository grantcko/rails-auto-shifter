class AddUnavailableDayIdsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unavailable_day_ids, :integer, default: [], array: true
  end
end
