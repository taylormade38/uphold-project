class AddStatColumnsToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :officer_involved_shootings, :integer
    add_column :cities, :officer_involved_killings, :integer
  end
end
