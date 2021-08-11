class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
