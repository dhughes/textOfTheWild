# frozen_string_literal: true

require 'item/item'
require 'item/buildable'

class Food < Item
  extend Buildable

  attr_accessor :health

  def initialize(name:, description:, health:)
    super(name: name, description: description)
    @health = health
  end

  def edible?
    true
  end

  FISH_AND_MUSHROOM_SKEWER = builder(
    name: 'Fish and Mushroom Skewer',
    description: 'A simple dish made by cooking skewered, fresh fish alongside fragrant mushrooms.',
    health: 0.5
  )
end
