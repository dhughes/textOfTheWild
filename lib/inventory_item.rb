# frozen_string_literal: true

require 'errors'

class InventoryItem
  attr_accessor :item, :quantity, :max_quantity

  def initialize(item:, quantity: 1, max_quantity: 999)
    @item = item
    @quantity = quantity
    @max_quantity = max_quantity
  end

  def add
    raise Errors::CantHoldMoreError.new if quantity == max_quantity
    self.quantity = quantity + 1
  end
end
