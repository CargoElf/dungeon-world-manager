class CreateStartingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :starting_items do |t|
      t.references :character_class, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
