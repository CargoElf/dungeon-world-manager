class CreateStartingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :starting_items do |t|
      t.references :player_character, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
