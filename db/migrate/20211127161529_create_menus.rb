class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :shop_id
      t.string :name
      t.string :image_id
      t.integer :price
      t.boolean :is_active, default: true
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
