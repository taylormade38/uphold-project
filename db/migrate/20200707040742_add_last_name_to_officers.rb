class AddLastNameToOfficers < ActiveRecord::Migration[6.0]
  def change
    add_column :officers, :last_name, :string
  end
end
