class AddOriginidProducts < ActiveRecord::Migration
  def up
    add_column :products, :origin_id, :integer
  end

  def down
    remove_column :products, :origin_id
  end
end
