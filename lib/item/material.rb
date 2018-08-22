# frozen_string_literal: true

require 'item/item'

class Material < Item
  attr_accessor :value

  def initialize(name:, description:, value:)
    super(name: name, description: description)
    @value = value
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

  class << self
    private :new
  end
end
