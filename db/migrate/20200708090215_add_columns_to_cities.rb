class AddColumnsToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :use_of_force_incidents, :integer
    add_column :cities, :use_of_force_weapons, :integer
    add_column :cities, :use_of_force_unarmed, :integer
    add_column :cities, :complaints_against_police, :integer
  end
end
