# frozen_string_literal: true

require 'item/ingredient'
#require 'inventory/inventory_item'
require 'set'

class Inventory
  attr_accessor :items

  def initialize
    @items = Set.new
  end

  def add(item)
    #items << InventoryItem.new(item: item)
  end

  # def contains?(item)
  #   items.include? InventoryItem.new(item: item)
  # end
end
