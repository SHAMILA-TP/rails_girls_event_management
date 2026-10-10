class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
