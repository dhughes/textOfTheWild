require 'item/item'
require 'item/edible'

class Ingredient < Item
  include Edible

  attr_accessor :name, :description, :value, :health

  def initialize(name:, description:, value:, health:)
    @name = name
    @description = description
    @value = value
    @health = health
  end

  ACORN = Ingredient.new(
    name: 'Acorn',
    description: 'Often found on the ground near trees. Squirrels adore this nut, so you may have competition while foraging. Add one to a meal for a nutty seasoning.',
    value: 2,
    health: 0.5
  ) # 10 second boost to recipe effects on first accorn
  APPLE = Ingredient.new(
    name: 'Apple',
    description: 'A common fruit found on trees all around Hyrule. Eat if fresh, or cook it to increase its effect.',
    value: 3,
    health: 0.5
  )
  BIG_HEARTY_RADISH = Ingredient.new(
    name: 'Big Hearty Radish',
    description: "This hearty radish has grown much larger than the average radish. It's rich in analeptic compounds that, when cooked into a dish, temporarily increase your maximum hearts.",
    value: 15,
    health: 4
  )

  class << self
    private :new
  end
end
