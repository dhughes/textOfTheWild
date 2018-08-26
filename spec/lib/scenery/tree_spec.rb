# frozen_string_literal: true

require 'scenery/tree'
require 'scenery/log'
require 'item/ingredient'
require 'item/weapon'
require 'item/material'
require 'errors'
require 'attack'

RSpec.describe Tree do

  describe '#take_damage' do
    context 'when a weapon is bladed' do
      it 'can damage a tree' do
        tree = Tree.new(health: 6)
        sword = Weapon::TRAVELERS_SWORD.new
        attack = Attack.new(implement: sword)
        durability = sword.durability

        result = tree.receive_attack(attack)

        expect(result).to eq(1)
        expect(tree.health).to eq(1)
        expect(sword.durability).to eq(durability - 1)
      end

      it 'can cut down a tree' do
        tree = Tree.new(health: 6)
        sword = Weapon::KNIGHTS_CLAYMORE.new
        attack = Attack.new(implement: sword)
        durability = sword.durability

        result = tree.receive_attack(attack)

        expect(result).to eq(0)
        expect(tree.health).to eq(0)
        expect(tree.drops).to include(a_kind_of(Log))
        expect(sword.durability).to eq(durability - 1)
      end
    end

    context 'when the weapon is not bladed' do
      it "doesn't damage the tree" do
        tree = Tree.new(health: 6)
        hammer = Weapon::IRON_SLEDGEHAMMER.new
        attack = Attack.new(implement: hammer)
        durability = hammer.durability

        result = tree.receive_attack(attack)

        expect(result).to eq(6)
        expect(tree.health).to eq(6)
        expect(hammer.durability).to eq(durability - 1)
      end
    end
  end


  # context 'before a tree dies' do
  #   it "returns the tree's remaining health" do
  #     tree = Tree.new(health: 5)
  #
  #     expect(tree.take_damage(2)).to eq(3)
  #   end
  #
  #   it 'has no dropped items' do
  #     tree = Tree.new(health: 5)
  #     expect(tree.dropped_items).to be_nil
  #   end
  # end
  #
  # context 'when a tree dies (is chopped down)' do
  #   it 'returns 0' do
  #     tree = Tree.new(health: 5)
  #
  #     expect(tree.take_damage(6)).to eq(0)
  #   end
  #
  #   it 'drops items' do
  #     tree = Tree.new(health: 5)
  #
  #     tree.take_damage(6)
  #
  #     expect(tree.dropped_items.first).to eq(Material::WOOD)
  #   end
  # end
end

