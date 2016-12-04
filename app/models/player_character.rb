class PlayerCharacter < ApplicationRecord
  has_one :character_class, dependent: :delete

  validates_presence_of :name, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  validates_each :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma do |player_character, attr, value|
    value = 0 if value == nil
    player_character.errors.add(attr, 'must be more than 0 and less then 19') if value > 18 || value < 1
  end

  validate :total_ability_score

  def str_mod
    mod(self.strength)
  end

  def dex_mod
    mod(self.dexterity)
  end

  def con_mod
    mod(self.constitution)
  end

  def int_mod
    mod(self.intelligence)
  end

  def wis_mod
    mod(self.wisdom)
  end

  def cha_mod
    mod(self.charisma)
  end

  def hit_points
    self.constitution
  end

  def load
  end

  private

  def mod(attribute)
    case attribute
    when 1, 2, 3 then -3
    when 4, 5 then -2
    when 6, 7, 8 then -1
    when 9, 10, 11, 12 then 0
    when 13, 14, 15 then 1
    when 16, 17 then 2
    when 18 then 3
    end
  end

  def total_ability_score
    total_score = check_nil("strength") + check_nil("dexterity") + check_nil("constitution") + check_nil("intelligence") + check_nil("wisdom") + check_nil("charisma")
    self.errors.add(:ability_score, "should equal #{72 + self.level}") if total_score > 72 + self.level
  end

  def check_nil(ability)
    self.send("#{ability}=", 0) if self.send(ability) == nil
    self.send(ability)
  end

  # t.string   "name",                       null: false
  # t.string   "description"
  # t.integer  "level",          default: 1
  # t.integer  "strength",       default: 1
  # t.integer  "dexterity",      default: 1
  # t.integer  "constitution",   default: 1
  # t.integer  "intelligence",   default: 1
  # t.integer  "wisdom",         default: 1
  # t.integer  "charisma",       default: 1
  # t.text     "inventory"
  # t.integer  "player_id"
  # t.integer  "game_master_id"

end
