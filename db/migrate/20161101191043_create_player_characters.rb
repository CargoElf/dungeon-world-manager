class CreatePlayerCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :player_characters do |t|
      t.string :name
      t.string :description
      t.integer :level, default: 1
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.text :inventory
      t.integer :player_id
      t.integer :game_master_id

      t.timestamps
    end
  end
end
