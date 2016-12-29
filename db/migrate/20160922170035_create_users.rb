class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :provider_id
      t.string :username
      t.string :password_digest
      t.string :password
      t.string :mobile
      t.boolean :admin, default: false
      t.string :roles

      t.timestamps null: false
    end

    add_index :users, :username,   unique: true

  end
end
