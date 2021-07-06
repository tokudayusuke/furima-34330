class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,           null: false
      t.text :description,          null: false
      t.integer :condition_id,      null: false
      t.integer :delivery_cost_id,  null: false
      t.integer :product_area_id,   null: false
      t.integer :delivery_day_id,   null: false
      t.integer :sale_price,        null: false
      t.integer :category_id,       null: false
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
