class PlayerCharacter < ApplicationRecord
  validates_presence_of :name, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  validates_each :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma do |player_character, attr, value|
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
    total_score = self.strength + self.dexterity + self.constitution + self.intelligence + self.wisdom + self.charisma
    self.errors.add(:ability_score, "should equal #{72 + self.level}") if total_score > 72 + self.level
  end

end
