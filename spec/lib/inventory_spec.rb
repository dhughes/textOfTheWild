require 'inventory'
require 'inventory_item'
require 'item/ingredient'

RSpec.describe Inventory do

	it 'exists' do
		Inventory.new
	end

	it 'is made up of inventory items' do
		expect(Inventory.new.items[Ingredient::APPLE]).to be_a(InventoryItem)
	end

	describe '#add' do
		it 'can hold items' do
			inventory = Inventory.new

			inventory.add(Ingredient::APPLE)

			expect(inventory.items[Ingredient::APPLE].quantity).to eq(1)
		end
	end

end
