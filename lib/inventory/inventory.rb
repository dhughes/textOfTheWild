# frozen_string_literal: true

require 'item/ingredient'
require 'item/mineral'
require 'inventory/inventory_item'
require 'set'

class Inventory
  attr_accessor :items, :max_slots

  def initialize(max_slots: nil)
    @items = {}
    @max_slots = max_slots
  end

  def add(item)
    inventory_item = InventoryItem.new(item)
    raise Errors::CantHoldMoreError unless can_hold_more?(inventory_item)

    items[inventory_item] = if items.include? inventory_item
                              items[inventory_item] + 1
                            else
                              1
                            end
  end

  def slots_used
    items.size
  end

  private

  def can_hold_more?(inventory_item)
    if items.include? inventory_item
      items[inventory_item] < 999
    else
      max_slots.nil? || slots_used < max_slots
    end
  end
end
