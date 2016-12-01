class CreateMatchEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :match_events do |t|
      t.string :event_name
      t.string :players
      t.string :team
      t.string :comment

      t.timestamps
    end
  end
end
