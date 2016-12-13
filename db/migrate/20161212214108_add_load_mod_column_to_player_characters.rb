class AddLoadModColumnToPlayerCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :player_characters, :load_mod, :integer
  end
end
