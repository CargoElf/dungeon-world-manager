class CreateClassRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :class_races do |t|
      t.references :character_class, foreign_key: true
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
