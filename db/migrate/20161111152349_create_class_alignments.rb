class CreateClassAlignments < ActiveRecord::Migration[5.0]
  def change
    create_table :class_alignments do |t|
      t.references :character_class, foreign_key: true
      t.references :alignment, foreign_key: true

      t.timestamps
    end
  end
end
