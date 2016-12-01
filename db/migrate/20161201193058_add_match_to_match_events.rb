class AddMatchToMatchEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :match_events, :match, foreign_key: true
  end
end
