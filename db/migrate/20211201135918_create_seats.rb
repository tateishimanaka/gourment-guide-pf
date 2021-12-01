class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|

      t.integer :shop_id
      t.string :seat_type
      t.string :image_id
      t.string :introduction
      t.string :people
      t.boolean :smoking, default: false
      t.string :reserve
      t.boolean :is_active, default: true
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
