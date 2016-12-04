class StartingItem < ApplicationRecord
  belongs_to :player_character
  belongs_to :item
end
