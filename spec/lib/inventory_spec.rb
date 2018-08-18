# frozen_string_literal: true

require 'inventory'
require 'inventory_item'
require 'item/ingredient'

RSpec.describe Inventory do
  it 'exists' do
    Inventory.new
  end

  describe '#add' do
    it 'can hold items' do
      inventory = Inventory.new

      inventory.add(Ingredient::APPLE)

      expect(inventory.items[Ingredient::APPLE].quantity).to eq(1)
    end

    it 'can hold multiples of the same items' do
      inventory = Inventory.new

      inventory.add(Ingredient::APPLE)
      inventory.add(Ingredient::APPLE)
      inventory.add(Ingredient::APPLE)

      expect(inventory.items[Ingredient::APPLE].quantity).to eq(3)
    end
  end
end
