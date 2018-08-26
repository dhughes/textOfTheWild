# frozen_string_literal: true

require 'item/ingredient'
require 'item/material'
require 'set'

class Inventory
  attr_accessor :items, :max_slots

  def initialize(max_slots: nil)
    @items = {}
    @max_slots = max_slots
  end

  def add(item)
    raise Errors::CantHoldMoreError unless can_hold_more?(item)

    items[item] = (items[item] || 0) + 1
  end

  alias_method :<<, :add

  def slots_used
    items.size
  end

  def include?(item)
    items.include? item
  end

  private

  def can_hold_more?(item)
    if items.include? item
      items[item] < 999
    else
      max_slots.nil? || slots_used < max_slots
    end
  end
end
