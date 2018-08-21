# frozen_string_literal: true

require 'errors'

class InventorySlot
  attr_accessor :item, :quantity

  MAX_QUANTITY = 999

  def initialize(item:)
    @item = item
    @quantity = 0
  end

  def add
    raise Errors::CantHoldMoreError.new if quantity == MAX_QUANTITY
    self.quantity = quantity + 1
  end
end
