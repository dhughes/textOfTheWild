# frozen_string_literal: true

require 'item/ingredient'
require 'inventory_item'

class Inventory
  attr_accessor :items

  def initialize
    @items = {}
  end

  def add(item)
    if items.key? item
      items[item].add
    else
      items[item] = InventoryItem.new
    end
  end
end
