# frozen_string_literal: true

require 'item/item'

class Material < Item
  attr_accessor :value, :health

  def initialize(name:, description:, value: nil, health: nil)
    super(name: name, description: description)
    @value = value
    @health = health
  end

  def edible?
    !health.nil?
  end

  def sellable?
    !value.nil?
  end

  AMBER = Material.new(
    name: 'Amber',
    description: "A fossilized resin with a caramelesque sheen to it. It's been valued as a component in decorations and crafting since ancient times.",
    value: 30
  )
  SUMMERWING_BUTTERFLY = Material.new(
    name: 'Summerwing Butterfly',
    description: 'A butterfly found in the woods and plains of warm regions. Its wings absorb the warmth of the sun. Cook it with monster parts to create an elixir that makes you feel warm and fuzzy.',
    value: 2
  )
  WOOD = Material.new(
    name: 'Wood',
    description: 'A portable bundle of wood. You can use this to make a campfire if you have something to light it.',
    value: 12
  )
  ACORN = Material.new(
    name: 'Acorn',
    description: 'Often found on the ground near trees. Squirrels adore this nut, so you may have competition while foraging. Add one to a meal for a nutty seasoning.',
    value: 2,
    health: 0.5
  ) # 10 second boost to recipe effects on first accorn
  APPLE = Material.new(
    name: 'Apple',
    description: 'A common fruit found on trees all around Hyrule. Eat if fresh, or cook it to increase its effect.',
    value: 3,
    health: 0.5
  )
  BIG_HEARTY_RADISH = Material.new(
    name: 'Big Hearty Radish',
    description: "This hearty radish has grown much larger than the average radish. It's rich in analeptic compounds that, when cooked into a dish, temporarily increase your maximum hearts.",
    value: 15,
    health: 4
  )
  ARMORANTH = Material.new(
    name: 'Armoranth',
    description: 'This tough medicinal plant cannot be broken, but it can be cooked. Its durable yet flexible fibers raise your defense when cooked into a dish.',
    value: 5
  )

  class << self
    private :new
  end
end
