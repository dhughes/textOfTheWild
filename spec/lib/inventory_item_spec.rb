# frozen_string_literal: true

require 'inventory_item'

RSpec.describe InventoryItem do
  it 'has a default quantity of 1' do
    item = InventoryItem.new

    expect(item.quantity).to eq(1)
  end

  it 'has a quantity' do
    item = InventoryItem.new(quantity: 5)

    expect(item.quantity).to eq(5)
  end

  it 'has a max quantity' do
    item = InventoryItem.new(max_quantity: 24)

    expect(item.max_quantity).to eq(24)
  end

  it 'defaults max_quantity to 999' do
    item = InventoryItem.new

    expect(item.max_quantity).to eq(999)
  end

  describe '#add' do
    it 'can add to the quantity held' do
      item = InventoryItem.new

      item.add

      expect(item.quantity).to eq(2)
    end

    context 'when adding more than the max quantity' do
      it 'raises an error' do
        expect(true).to be(false)
      end
    end
  end
end
