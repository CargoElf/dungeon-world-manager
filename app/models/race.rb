class Race < ApplicationRecord
  has_many :player_characters

  validates_presence_of :name, :description
end
