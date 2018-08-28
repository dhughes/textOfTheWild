# frozen_string_literal: true

require 'item/item'
require 'item/buildable'

class Shield < Item
  extend Buildable

  attr_accessor :strength, :durability, :metallic

  def initialize(name:, description:, strength:, durability:, metallic:)
    super(name: name, description: description)
    @strength = strength
    @durability = durability
    @metallic = metallic
  end

  def metallic?
    metallic
  end

  HYLIAN_SHIELD = builder(
    name: 'Hylian Shield',
    description: 'A shield passed down through the Hyrulean royal family, along with the legend of the hero who wielded it. Its defensive capabilities and durability outshine all other shields.',
    strength: 90,
    durability: 800,
    metallic: true
  )
  POT_LID = builder(
    name: 'Pot Lid',
    description: 'The lid of a large soup pot. It smells vaguely of chicken broth... Yum! It can take quite a beating before breaking.',
    strength: 1,
    durability: 10,
    metallic: false
  )
end
