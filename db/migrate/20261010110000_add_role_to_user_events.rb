class AddRoleToUserEvents < ActiveRecord::Migration[8.0]
  def up
    add_column :user_events, :role, :string, default: "volunteer", null: false

    execute <<~SQL
      UPDATE user_events SET role = 'organizer' WHERE is_organizer = 'true'
    SQL
  end

  def down
    remove_column :user_events, :role
  end
end
