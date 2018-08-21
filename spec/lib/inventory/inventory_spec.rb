# frozen_string_literal: true

require 'inventory/inventory'
# require 'inventory/inventory_item'
require 'item/ingredient'

RSpec.describe Inventory do
  it 'exists' do
    Inventory.new
  end

  describe '#add' do
    it 'can add items to inventory' do
      inventory = Inventory.new

      inventory.add(Ingredient::APPLE)
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
