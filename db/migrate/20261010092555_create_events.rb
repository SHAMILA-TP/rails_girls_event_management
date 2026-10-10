class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :starts_at
      t.string :category
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
