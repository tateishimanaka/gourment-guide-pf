class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|

      t.string :image_id
      t.integer :shop_id
      t.string :introduction
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
