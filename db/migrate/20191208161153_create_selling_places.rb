class CreateSellingPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :selling_places do |t|
      t.string :name
      t.string :address
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
