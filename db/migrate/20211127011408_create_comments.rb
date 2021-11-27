class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      
      t.integer :shop_id
      t.integer :customer_id
      t.text :comment
      t.float :rate
      t.datetime :created_at
      t.datetime :updated_at
      
      t.timestamps
    end
  end
end
