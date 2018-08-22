# frozen_string_literal: true

require 'item/ingredient'
require 'item/mineral'

class InventoryItem
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def ==(other)
    if self.class == other.class && stackable? && other.stackable?
      item == other.item
    else
      super
    end
  end

  def eql?(other)
    self == other
  end

  def hash
    if stackable?
      InventoryItem.hash & item.hash
    else
      super
    end
  end

  def stackable?
    [Ingredient, Mineral].include? item.class
  end
end
