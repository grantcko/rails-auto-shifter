class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.integer :category
      t.text :note
      t.integer :unavailable_shift_ids, array: true, default: []
      t.references :user, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
