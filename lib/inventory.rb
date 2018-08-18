require 'item/ingredient'
require 'inventory_item'

class Inventory
	attr_accessor :items

	def initialize
		@items = {
			Ingredient::APPLE => InventoryItem.new,
			Ingredient::BIG_HEARTY_RADISH => InventoryItem.new
		}
	end

	def add(item)
		self.items[item].add
	end

end
