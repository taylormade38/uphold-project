class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.text :info
      t.boolean :positive

      t.timestamps
    end
  end
end
