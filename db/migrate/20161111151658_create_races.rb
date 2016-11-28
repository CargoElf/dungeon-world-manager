class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps(null: false)
    end
  end
end
