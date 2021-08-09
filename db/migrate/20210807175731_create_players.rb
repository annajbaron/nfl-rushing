class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :team
      t.belongs_to :position
      t.integer :rushing_attempts
      t.float :rushing_attempts_per_game
      t.integer :total_rushing_yards
      t.float :average_rushing_yards_attempt
      t.float :rushing_yards_per_game
      t.integer :total_rushing_touchdowns
      t.string :longest_rush
      t.integer :rushing_first_downs
      t.decimal :rushing_first_down_percentage
      t.integer :rushing_twenty_yards
      t.integer :rushing_forty_yards
      t.integer :rushing_fumbles

      t.timestamps
    end
  end
end
