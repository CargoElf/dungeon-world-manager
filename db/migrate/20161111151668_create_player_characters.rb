class CreatePlayerCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :player_characters do |t|
      t.string :name, null: false
      t.string :description
      t.string :class_name, null: false
      t.integer :hp_mod, default: 4
      t.integer :exp_points, default: 0
      t.integer :level, default: 1
      t.integer :strength, default: 1
      t.integer :dexterity, default: 1
      t.integer :constitution, default: 1
      t.integer :intelligence, default: 1
      t.integer :wisdom, default: 1
      t.integer :charisma, default: 1
      t.text :inventory
      t.integer :player_id
      t.integer :game_master_id
      t.references :race, foreign_key: true
      t.references :alignment, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
