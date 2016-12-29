class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :user_id  
      t.string :company_name
      t.string :category
      t.string :area
      t.string :address
      t.string :contact_name
      t.string :contact_title
      t.string :mobile
      t.string :telephone
      t.string :fax
      t.string :qq
      t.string :roles
      t.string :status

      t.timestamps null: false
    end
  end
end
