class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :food_menu, foreign_key: { to_table: :food_menus }

      t.timestamps
      
      t.index [:user_id, :food_menu_id], unique: true
    end
  end
end
