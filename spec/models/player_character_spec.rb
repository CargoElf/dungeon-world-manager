require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
  include ModelHelper
  let(:pc) { PlayerCharacter.new(name: "John", strength: 16, dexterity: 15, constitution: 13, intelligence: 12, wisdom: 9, charisma: 8) }

  describe "Ability Scores" do
    it "Gives error if over 18" do
      pc.strength = 19
      expect{raise pc.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Gives error if under 1" do
      pc.strength = 0
      expect{raise pc.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Gives error is total scores too high" do
      pc.strength = 17
      expect{raise pc.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "Ability Modifiers" do
    array_of_modifiers = [3,2,2,1,1,1,0,0,0,0,-1,-1,-1,-2,-2,-3,-3,-3]

    it "Correct strength mods for 18-1" do
      pc.strength = 18
      expect(test_stat_range(pc, "strength")).to eq array_of_modifiers
    end

    it "Correct dexterity mods for 18-1" do
      pc.dexterity = 18
      expect(test_stat_range(pc, "dexterity")).to eq array_of_modifiers
    end

    it "Correct constitution mods for 18-1" do
      pc.constitution = 18
      expect(test_stat_range(pc, "constitution")).to eq array_of_modifiers
    end

    it "Correct intelligence mods for 18-1" do
      pc.intelligence = 18
      expect(test_stat_range(pc, "intelligence")).to eq array_of_modifiers
    end

    it "Correct wisdom mods for 18-1" do
      pc.wisdom = 18
      expect(test_stat_range(pc, "wisdom")).to eq array_of_modifiers
    end

    it "Correct charisma mods for 18-1" do
      pc.charisma = 18
      expect(test_stat_range(pc, "charisma")).to eq array_of_modifiers
    end

  end

  describe "Hit Points" do
    it "Adds class and constitution together"
  end

end
