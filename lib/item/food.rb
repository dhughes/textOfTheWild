# frozen_string_literal: true

require 'item/item'
require 'item/edible'

class Food < Item
  include Edible

  attr_accessor :health

  def initialize(name:, description:, health:)
    super(name: name, description: description, value: nil)
    @health = health
  end

  FISH_AND_MUSHROOM_SKEWER = Food.new(
    name: 'Fish and Mushroom Skewer',
    description: 'A simple dish made by cooking skewered, fresh fish alongside fragrant mushrooms.',
    health: 0.5
  )

  class << self
    private :new
  end
end
