# frozen_string_literal: true

require 'attack'
require 'item/weapon'
require 'item/bow'
require 'item/arrow'

RSpec.describe Attack do

  context 'when using a weapon' do
    it 'calculates total attack power' do
      sword = Weapon::TRAVELERS_SWORD.new
      attack = Attack.new(implement: sword)
      expect(attack.power).to be(sword.attack)
    end
  end

  context 'when using a bow' do
    it 'calculates the total using the arrow bonus' do
      bow = Bow::WOODEN_BOW.new
      arrow = Arrow::ARROW
      attack = Attack.new(implement: bow, modifier: arrow)

      expect(attack.power).to be(bow.attack + arrow.attack)
    end
  end

  describe '#received' do
    it 'wears down attack weapon' do
      sword = Weapon::TRAVELERS_SWORD.new
      durability = sword.durability
      attack = Attack.new(implement: sword)

      attack.received

      expect(sword.durability).to eq(durability - 1)
    end
  end
end
