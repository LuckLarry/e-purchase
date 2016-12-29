class ToUsePolymorphicForPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :tag, :string

    add_column :photos, :photoable_type, :string
    add_column :photos, :photoable_id, :integer

    remove_column :photos, :provider_id
    remove_column :photos, :product_id
  end

  def down
    add_column :photos, :product_id, :integer
    add_column :photos, :provider_id, :integer

    remove_column :photos, :photoable_id
    remove_column :photos, :photoable_type

    remove_column :photos, :tag
  end
end
