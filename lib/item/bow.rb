# frozen_string_literal: true

require 'item/item'
require 'item/buildable'

class Bow < Item
  extend Buildable

  attr_accessor :attack, :durability, :range, :metallic

  def initialize(name:, description:, attack:, durability:, range:, metallic:)
    super(name: name, description: description)
    @attack = attack
    @durability = durability
    @range = range
    @metallic = metallic
  end

  def metallic?
    metallic
  end

  BOW_OF_LIGHT = builder(
    name: 'Bow of Light',
    description: 'Princess Zelda gave you this bow and arrow for the battle with Dark beast Ganon. When wielded by the hero, it fires arrows of pure light strong enough to oppose the Calamity.',
    attack: 100,
    durability: 100,
    range: 500,
    metallic: true
  )
  WOODEN_BOW = builder(
    name: 'Wooden Bow',
    description: 'This wooden bow may not be the most reliable for battling monsters, but it is excellent for hunting small animals.',
    attack: 4,
    durability: 20,
    range: 20,
    metallic: false
  )
end
