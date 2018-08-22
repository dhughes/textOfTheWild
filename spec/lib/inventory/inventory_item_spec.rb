# frozen_string_literal: true

require 'inventory/inventory_item'
require 'item/ingredient'
require 'item/food'

RSpec.describe InventoryItem do
  it 'holds an item' do
    InventoryItem.new(Ingredient::ACORN)
  end

  context 'when holding a stackable item' do
    it 'is equal to another inventory item holding the same item' do
      inventory_item1 = InventoryItem.new(Ingredient::ACORN)
      inventory_item2 = InventoryItem.new(Ingredient::ACORN)

      expect(inventory_item1 == inventory_item2).to be(true)
      expect(inventory_item1.eql?(inventory_item2)).to be(true)
      expect(inventory_item1).to eq(inventory_item2)
    end

    it 'has the same hash as another inventory item holding the same item' do
      inventory_item1 = InventoryItem.new(Ingredient::ACORN)
      inventory_item2 = InventoryItem.new(Ingredient::ACORN)

      expect(inventory_item1.hash).to eq(inventory_item2.hash)
    end
  end

  context 'when holding a non-stackable item' do
    it 'is not equal to another inventory item holding the same item' do
      inventory_item1 = InventoryItem.new(Food::FISH_AND_MUSHROOM_SKEWER)
      inventory_item2 = InventoryItem.new(Food::FISH_AND_MUSHROOM_SKEWER)


      expect(inventory_item1 != inventory_item2).to be(true)
      expect(inventory_item1.eql?(inventory_item2)).to be(false)
      expect(inventory_item1).not_to eq(inventory_item2)
    end

    it 'has a different hash than another inventory item holding the same item' do
      inventory_item1 = InventoryItem.new(Food::FISH_AND_MUSHROOM_SKEWER)
      inventory_item2 = InventoryItem.new(Food::FISH_AND_MUSHROOM_SKEWER)

      expect(inventory_item1.hash).not_to eq(inventory_item2.hash)
    end
  end
end