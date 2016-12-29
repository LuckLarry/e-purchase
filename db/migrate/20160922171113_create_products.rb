class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :provider_id
      t.string :category
      t.string :product_status
      t.string :status
      t.string :name
      t.string :number
      t.string :unit
      t.string :price
      t.string :start_volume
      t.string :volume
      t.string :brand
      t.string :spec
      t.string :mark
      t.string :roles

      t.timestamps null: false
    end
  end
end
