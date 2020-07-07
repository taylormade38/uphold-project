class RemoveDepartmentsFromCities < ActiveRecord::Migration[6.0]
  def change
    remove_column :cities, :departments, :string
  end
end
