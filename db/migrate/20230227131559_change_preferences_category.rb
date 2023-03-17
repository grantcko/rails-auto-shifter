class ChangePreferencesCategory < ActiveRecord::Migration[7.0]
  def change
    change_column :preferences, :category, :integer, default: 0, using: 'category::integer'
  end
end
