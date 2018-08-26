# frozen_string_literal: true

require 'inventory/inventory'
require 'item/ingredient'
require 'item/food'
require 'errors'

RSpec.describe Inventory do
  describe '#add' do
    it 'can add items to inventory' do
      inventory = Inventory.new

      inventory.add(Ingredient::APPLE)
    end

    it 'stacks multiple ingredients in one slot' do
      inventory = Inventory.new

      inventory.add(Ingredient::APPLE)
      inventory.add(Ingredient::APPLE)

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

      inventory.add(Ingredient::APPLE)
      inventory.add(Ingredient::APPLE)
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

        inventory.add(Ingredient::APPLE)
        inventory.add(Ingredient::APPLE)
        inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)

        expect do
          inventory.add(Food::FISH_AND_MUSHROOM_SKEWER.new)
        end.to raise_error(Errors::CantHoldMoreError)
      end

      it "takes into consideration if we've reached the max number of an item in a stack" do
        inventory = Inventory.new(max_slots: 2)

        expect do
          1000.times { inventory.add(Ingredient::APPLE) }
        end.to raise_error(Errors::CantHoldMoreError)
      end
    end

    # it 'items added to inventory appear in inventory' do
    #   inventory = Inventory.new
    #
    #   inventory.add(Ingredient::APPLE)
    #
    #   expect(inventory.contains?(Ingredient::APPLE)).to be(true)
    # end
    #
    # it "items not added to the inventory don't appear in it" do
    #   inventory = Inventory.new
    #
    #   inventory.add(Ingredient::APPLE)
    #
    #   expect(inventory.contains?(Ingredient::BIG_HEARTY_RADISH)).
    #     to be(false)
    # end

    # context 'when items are grouped together' do
    #   it 'holds one inventory item for the item' do
    #     inventory = Inventory.new
    #
    #     inventory.add(Ingredient::APPLE)
    #     inventory.add(Ingredient::APPLE)
    #     inventory.add(Ingredient::APPLE)
    #
    #     expect(inventory.items[Ingredient::APPLE].quantity).to eq(3)
    #   end
    # end
  end
end
