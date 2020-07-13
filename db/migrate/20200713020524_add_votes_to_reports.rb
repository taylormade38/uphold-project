class AddVotesToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :votes, :integer, :null => false, :default => 0
  end
end
