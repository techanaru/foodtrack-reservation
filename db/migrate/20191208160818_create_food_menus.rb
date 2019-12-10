class CreateFoodMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :food_menus do |t|
      t.string :name
      t.string :picture
      t.integer :sales_quantity
      t.integer :price
      t.references :food_track, foreign_key: { to_table: :food_tracks }

      t.timestamps
    end
  end
end
