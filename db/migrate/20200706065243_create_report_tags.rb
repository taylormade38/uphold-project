class CreateReportTags < ActiveRecord::Migration[6.0]
  def change
    create_table :report_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
