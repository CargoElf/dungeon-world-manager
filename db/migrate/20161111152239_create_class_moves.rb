class CreateClassMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :class_moves do |t|
      t.integer :move_level
      t.references :character_class, foreign_key: true
      t.references :move, foreign_key: true

      t.timestamps
    end
  end
end
