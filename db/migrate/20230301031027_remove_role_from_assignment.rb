class RemoveRoleFromAssignment < ActiveRecord::Migration[7.0]
  def change
    remove_column :assignments, :role
  end
end
