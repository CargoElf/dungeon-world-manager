class PlayerCharacter < ApplicationRecord
  validates_presence_of :name, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

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

end
