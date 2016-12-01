class AddScorerToMatch < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :scorer, foreign_key: true
  end
end
