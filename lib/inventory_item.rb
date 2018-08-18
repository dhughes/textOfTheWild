# frozen_string_literal: true

class InventoryItem
  attr_accessor :quantity, :max_quantity

  def initialize(quantity: 1, max_quantity: 999)
    @quantity = quantity
    @max_quantity = max_quantity
  end

  def add
    self.quantity = quantity + 1
  end
end
