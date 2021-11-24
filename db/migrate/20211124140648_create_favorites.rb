class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.integer :shop_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
