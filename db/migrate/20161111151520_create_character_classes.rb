class CreateCharacterClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :character_classes do |t|
      t.string :name, null: false
      t.integer :hp_mod, default: 4
      t.integer :exp_points, default: 0
      t.references :player_character, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
