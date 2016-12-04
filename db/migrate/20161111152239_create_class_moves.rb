class CreateClassMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :class_moves do |t|
      t.integer :move_level
      t.references :player_character, foreign_key: true
      t.references :move, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
