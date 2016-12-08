class AddSportToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :sport, :string , null: false, default: ""
  end
end
