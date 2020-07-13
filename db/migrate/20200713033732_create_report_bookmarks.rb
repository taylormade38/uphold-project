class CreateReportBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :report_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
