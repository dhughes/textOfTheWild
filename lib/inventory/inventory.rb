# frozen_string_literal: true

require 'item/ingredient'
#require 'inventory/inventory_item'
require 'set'

class Inventory
  attr_accessor :items, :slots

  def initialize(slots:)
    @items = []
    @slots = slots
  end

  def add(item)
    raise Errors::CantHoldMoreError unless can_hold_more?(item)
    items << item
  end

  private

  def can_hold_more?(item)
    if stackable?(item)
      # the item is stackable
      count(item)
    else
      # the item is not stackable
      items.size == slots
    end

  end

  def stackable?(item)
    [Item::Ingredient, Item::Mineral].include? item.class
  end

  def count(item)
    items.select { |inventory_item| inventory_item == item }.size
  end

  

  # def contains?(item)
  #   items.include? InventoryItem.new(item: item)
  # end
end
