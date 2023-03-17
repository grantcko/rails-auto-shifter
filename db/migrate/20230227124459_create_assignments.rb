class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :role
      t.references :user, null: false, foreign_key: true
      t.references :shift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
