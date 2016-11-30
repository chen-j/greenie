class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :teamAName, null: false
      t.string :teamBName, null: false
      t.integer :teamAScore, default: 0
      t.integer :teamBScore, default: 0
      t.string :matchStatus, default: "upcoming", null: false
      t.string :venue
      t.string :city
      t.string :firstRef
      t.string :secondRef
      t.datetime :matchDate, null: false
      t.string :competition

      t.timestamps
    end
  end
end
