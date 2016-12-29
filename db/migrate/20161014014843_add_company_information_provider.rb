class AddCompanyInformationProvider < ActiveRecord::Migration
  def up
    add_column :providers, :company_information, :text
  end

  def down
    remove_column :providers, :company_information
  end
end
