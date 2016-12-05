class RenameMatchDateToMatchdate < ActiveRecord::Migration[5.0]
  def change
      rename_column :matches, :matchDate, :matchdate
  end
end
