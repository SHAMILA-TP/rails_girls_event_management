class AddDetailsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :description, :text
    add_column :events, :location, :string
    add_column :events, :category, :string
    add_column :events, :price, :decimal
    add_column :events, :image_url, :string
  end
end
