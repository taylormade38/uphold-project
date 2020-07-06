class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.text :content
      t.string :evaluation
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :officer, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
