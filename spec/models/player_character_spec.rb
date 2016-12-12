require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
  include ModelHelper
  let(:pc) { PlayerCharacter.new(name: "John", strength: 16, dexterity: 15, constitution: 13, intelligence: 12, wisdom: 9, charisma: 8) }

  describe "Ability Scores" do
    it "Has readable ability scores" do
      expect([pc.strength, pc.dexterity, pc.constitution, pc.intelligence, pc.wisdom, pc.charisma]).to eq [16,15,13,12,9,8]
    end

    it "Has writable ability scores" do
      expect([pc.strength = 1, pc.dexterity = 1, pc.constitution = 1, pc.intelligence = 1, pc.wisdom = 1, pc.charisma = 1]).to eq [1,1,1,1,1,1]
    end

    it "Gives error if over 18" do
      pc.strength = 19
      expect{pc.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Gives error if under 1" do
      pc.strength = 0
      expect{pc.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Gives error is total scores too high" do
      pc.strength = 17
      expect{pc.save!}.to raise_error(ActiveRecord::RecordInvalid)
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
    it "Adds class and constitution together" do
      pc.constitution = 10
      expect(pc.hit_points).to eq 14
    end
  end

  describe "load" do

  end

end
