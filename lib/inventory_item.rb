
class InventoryItem
	attr_accessor :quantity, :max_quantity

	def initialize(quantity: 0, max_quantity: 999)
		@quantity = quantity
		@max_quantity = max_quantity
	end

	def add
		self.quantity = self.quantity + 1
	end

end
