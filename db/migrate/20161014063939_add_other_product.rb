class AddOtherProduct < ActiveRecord::Migration
  def up
    add_column :products, :other, :text
  end

  def down
    remove_column :products, :other
  end
end
