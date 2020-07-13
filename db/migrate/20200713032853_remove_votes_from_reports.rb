class RemoveVotesFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :votes, :integer
  end
end
