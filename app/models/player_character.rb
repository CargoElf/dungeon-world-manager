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
    attribute
  end
end
