# frozen_string_literal: true

require 'item/item'

class Mineral < Item
  attr_accessor :value

  def initialize(name:, description:, value:)
    super(name: name, description: description, value: value)
  end

  AMBER = Mineral.new(name: 'Amber', description: "A fossilized resin with a caramelesque sheen to it. It's been valued as a component in decorations and crafting since ancient times.", value: 30)

  class << self
    private :new
  end
end
