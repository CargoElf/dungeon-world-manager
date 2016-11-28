class CharacterClass < ApplicationRecord
  belongs_to :player_character
  has_many :class_alignments
  has_many :alignments, through: :class_alignments
  has_many :class_bonds
  has_many :bonds, through: :class_bonds
  has_many :class_moves
  has_many :moves, through: :class_moves
  has_many :class_races
  has_many :races, through: :class_races
  has_many :starting_items
  has_many :items, through: :starting_items


end
