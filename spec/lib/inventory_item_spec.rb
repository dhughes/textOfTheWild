# frozen_string_literal: true

require 'inventory_item'
require 'errors'
require 'item/ingredient'

RSpec.describe InventoryItem do
  it 'has a default quantity of 1' do
    item = InventoryItem.new(item: Ingredient::APPLE)

    expect(item.quantity).to eq(1)
  end

  it 'has a quantity' do
    item = InventoryItem.new(item: Ingredient::APPLE, quantity: 5)

    expect(item.quantity).to eq(5)
  end

  it 'has a max quantity' do
    item = InventoryItem.new(item: Ingredient::APPLE, max_quantity: 24)

    expect(item.max_quantity).to eq(24)
  end

  it 'defaults max_quantity to 999' do
    item = InventoryItem.new(item: Ingredient::APPLE)

    expect(item.max_quantity).to eq(999)
  end

  describe '#add' do
    it 'can add to the quantity held' do
      item = InventoryItem.new(item: Ingredient::APPLE)

      item.add

      expect(item.quantity).to eq(2)
    end

    context 'when adding more than the max quantity' do
      it 'raises an error' do
        item = InventoryItem.new(
          item: Ingredient::APPLE,
          max_quantity: 3
        )

        item.add
        item.add

        expect { item.add }.to raise_error(Errors::CantHoldMoreError)
      end
    end
  end

  context 'when comparing two inventory items holding the same items' do
    context 'when the items should be grouped together' do
      it 'they are equal regardless of quantity held' do
        item1 = InventoryItem.new(item: Ingredient::APPLE)
        item2 = InventoryItem.new(item: Ingredient::APPLE, quantity: 5)
      end
    end
  end
end
