class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :money
      t.string :product_name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :delivery_charge_id
      t.integer :prefectures_id
      t.integer :days_to_ship_id
      t.timestamps
    end
  end
end
