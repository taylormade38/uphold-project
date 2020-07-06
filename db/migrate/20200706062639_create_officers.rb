class CreateOfficers < ActiveRecord::Migration[6.0]
  def change
    create_table :officers do |t|
      t.string :name
      t.integer :badge_number
      t.string :department
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
