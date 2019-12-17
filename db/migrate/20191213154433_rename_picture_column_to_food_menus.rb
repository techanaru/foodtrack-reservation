class RenamePictureColumnToFoodMenus < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_menus, :picture, :image
  end
end
