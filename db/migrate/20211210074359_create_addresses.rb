class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,          null: false, foreign_key: true
      t.string :postal_code,        null:false
      t.integer :shipping_area_id,  null: false
      t.string :city,               null: false
      t.string :address,            null: false
      t.string :address_line1,      optional: false
      t.string :tell,               null: false
      t.timestamps
    end
  end
end
