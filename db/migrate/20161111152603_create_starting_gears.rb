class CreateStartingGears < ActiveRecord::Migration[5.0]
  def change
    create_table :starting_gears do |t|
      t.references :character_class, foreign_key: true
      t.references :gear, foreign_key: true

      t.timestamps
    end
  end
end
