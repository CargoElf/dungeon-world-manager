class StartingGear < ApplicationRecord
  belongs_to :character_class
  belongs_to :item
end
