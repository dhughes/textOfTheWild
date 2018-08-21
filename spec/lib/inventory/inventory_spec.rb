# frozen_string_literal: true

require 'inventory/inventory'
require 'item/ingredient'
require 'item/food'
require 'errors'

RSpec.describe Inventory do
  it 'exists' do
    Inventory.new(slots: 10)
  end

  describe '#add' do
    it 'can add items to inventory' do
      inventory = Inventory.new(slots: 10)

      inventory.add(Ingredient::APPLE)
    end

    it 'can add multiple of the same item to the inventory' do
      inventory = Inventory.new(slots: 10)

      inventory.add(Ingredient::APPLE)
      inventory.add(Ingredient::APPLE)
    end

    it 'has a maximum number of slots' do
      inventory = Inventory.new(slots: 2)

      expect(inventory.slots).to eq(2)
    end

    context 'when adding more items than the inventory can hold' do
      it 'raises an error' do
        inventory = Inventory.new(slots: 2)

        expect do
          inventory.add(Food::FISH_AND_MUSHROOM_SKEWER)
          inventory.add(Food::FISH_AND_MUSHROOM_SKEWER)
          inventory.add(Food::FISH_AND_MUSHROOM_SKEWER)
        end.to raise_error(Errors::CantHoldMoreError)
      end

      it 'takes into account whether items can be stacked or not' do
        inventory = Inventory.new(slots: 2)

        inventory.add(Ingredient::APPLE)
        inventory.add(Ingredient::APPLE)
        inventory.add(Ingredient::APPLE)

        expect(inventory.size).to eq(1)
      end

      it "takes into consideration if we've reached the max number of an item in a stack" do
        inventory = Inventory.new(slots: 2)

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
