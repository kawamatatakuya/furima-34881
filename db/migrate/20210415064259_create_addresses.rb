class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps

      t.string :postal_code,          null: false
      t.string :city,                 null: false
      t.string :address,              null: false
      t.string :building
      t.string :phone,                null: false
      t.integer :shipment_street_id,  null: false
      t.references :purchase,         foreign_key: true
    end
  end
end