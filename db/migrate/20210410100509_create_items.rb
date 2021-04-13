class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps

      t.string  :product,             null: false
      t.text    :product_description, null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivery_fee_id,     null: false
      t.integer :shipment_street_id,  null: false
      t.integer :shipment_day_id,     null: false
      t.integer :price,               null: false
      t.references :user, foreign_key: true
    end
  end
end