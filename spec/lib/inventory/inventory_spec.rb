# frozen_string_literal: true

require 'inventory/inventory'
require 'item/food'
require 'item/material'
require 'errors'

RSpec.describe Inventory do
  describe '#add' do
    it 'can add items to inventory' do
      inventory = Inventory.new

      inventory.add(Material::APPLE)
    end

    it 'stacks multiple ingredients in one slot' do
      inventory = Inventory.new

      inventory.add(Material::APPLE)
      inventory.add(Material::APPLE)

      expect(inventory.slots_used).to eq(1)
    end

    it 'does not stack meals in one slot' do
      inventory = Inventory.new

      inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)
      inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)

      expect(inventory.slots_used).to eq(2)
    end

    it 'correctly stack (or not) different types of items in slots' do
      inventory = Inventory.new

      inventory.add(Material::APPLE)
      inventory.add(Material::APPLE)
      inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)
      inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)

      expect(inventory.slots_used).to eq(3)
    end

    it 'has a maximum number of slots' do
      inventory = Inventory.new(max_slots: 2)

      expect(inventory.max_slots).to eq(2)
    end

    context 'when adding more items than the inventory can hold' do
      it 'raises an error' do
        inventory = Inventory.new(max_slots: 2)
        inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)
        inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)

        expect do
          inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)
        end.to raise_error(Errors::CantHoldMoreError)
      end

      it 'takes into account whether items can be stacked or not' do
        inventory = Inventory.new(max_slots: 2)

        inventory.add(Material::APPLE)
        inventory.add(Material::APPLE)
        inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)

        expect do
          inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)
        end.to raise_error(Errors::CantHoldMoreError)
      end

      it "takes into consideration if we've reached the max number of an item in a stack" do
        inventory = Inventory.new(max_slots: 2)

        expect do
          1000.times { inventory.add(Material::APPLE) }
        end.to raise_error(Errors::CantHoldMoreError)
      end
    end
  end

  describe '#inlude?' do
    context 'when an item is in the inventory' do
      it 'returns true' do
        inventory = Inventory.new
        inventory.add(Material::APPLE)

        expect(inventory.include?(Material::APPLE)).to eq(true)
      end

      it 'has << as an alias' do
        inventory = Inventory.new
        inventory << Material::APPLE

        expect(inventory.include?(Material::APPLE)).to eq(true)
      end
    end
  end
end
