class CreateClassBonds < ActiveRecord::Migration[5.0]
  def change
    create_table :class_bonds do |t|
      t.references :character_class, foreign_key: true
      t.references :bond, foreign_key: true

      t.timestamps
    end
  end
end
