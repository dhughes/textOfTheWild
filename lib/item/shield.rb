# frozen_string_literal: true

require 'item/item'

class Shield < Item
  attr_accessor :strength, :durability

  def initialize(name:, description:, strength:, durability:)
    super(name: name, description: description)
    @strength = strength
    @durability = durability
  end

  HYLIAN_SHIELD = Shield.new(
    name: 'Hylian Shield',
    description: 'A shield passed down through the Hyrulean royal family, along with the legend of the hero who wielded it. Its defensive capabilities and durability outshine all other shields.',
    strength: 90,
    durability: 800
  )
  POT_LID = Shield.new(
    name: 'Pot Lid',
    description: 'The lid of a large soup pot. It smells vaguely of chicken broth... Yum! It can take quite a beating before breaking.',
    strength: 1,
    durability: 10
  )

  class << self
    private :new
  end

end