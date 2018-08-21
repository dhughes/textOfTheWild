# frozen_string_literal: true

require 'inventory/inventory_slot'
require 'errors'
require 'item/ingredient'

RSpec.describe InventorySlot do
  it 'has a quantity' do
    item = InventorySlot.new(item: Ingredient::APPLE)

    expect(item.quantity).to eq(0)
  end

  context 'when an item can be grouped' do
    it 'has a quantity equal to the number of the item in the inventory' do
      slot = InventorySlot.new(item: Ingredient::APPLE)

      slot.add
      slot.add

      expect(slot.quantity).to eq(2)
    end
  end

  context 'when an item can not be grouped' do

  end

  # it 'has a max quantity' do
  #   item = InventorySlot.new(item: Ingredient::APPLE, max_quantity: 24)
  #
  #   expect(item.max_quantity).to eq(24)
  # end
  #
  # it 'defaults max_quantity to 999' do
  #   item = InventorySlot.new(item: Ingredient::APPLE)
  #
  #   expect(item.max_quantity).to eq(999)
  # end
  #
  # describe '#add' do
  #   it 'can add to the quantity held' do
  #     item = InventorySlot.new(item: Ingredient::APPLE)
  #
  #     item.add
  #
  #     expect(item.quantity).to eq(2)
  #   end
  #
  #   context 'when adding more than the max quantity' do
  #     it 'raises an error' do
  #       item = InventorySlot.new(
  #         item: Ingredient::APPLE,
  #         max_quantity: 3
  #       )
  #
  #       item.add
  #       item.add
  #
  #       expect { item.add }.to raise_error(Errors::CantHoldMoreError)
  #     end
  #   end
  # end
  #
  # context 'when comparing two inventory items holding the same items' do
  #   context 'when the items should be grouped together' do
  #     it 'they are equal regardless of quantity held' do
  #       item1 = InventorySlot.new(item: Ingredient::APPLE)
  #       item2 = InventorySlot.new(item: Ingredient::APPLE, quantity: 5)
  #     end
  #   end
  # end
end
