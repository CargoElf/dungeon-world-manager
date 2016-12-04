class CreateClassBonds < ActiveRecord::Migration[5.0]
  def change
    create_table :class_bonds do |t|
      t.references :player_character, foreign_key: true
      t.references :bond, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
