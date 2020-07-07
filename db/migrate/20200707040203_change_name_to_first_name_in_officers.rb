class ChangeNameToFirstNameInOfficers < ActiveRecord::Migration[6.0]
  def change
     rename_column :officers, :name, :first_name
  end
end
