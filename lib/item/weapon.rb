# frozen_string_literal: true

require 'item/item'
require 'item/buildable'

class Weapon < Item
  extend Buildable

  attr_accessor :attack, :durability, :metallic

  def initialize(name:, description:, attack:, durability:, metallic:)
    super(name: name, description: description)
    @attack = attack
    @durability = durability
    @metallic = metallic
  end

  def metallic?
    metallic
  end

  TREE_BRANCH = builder(
    name: 'Tree Branch',
    description: "Wooden branches such as this are pretty common, but it's surprisingly well-balanced. It doesn't do much damage but can serve as a weapon in a pinch.",
    attack: 2,
    durability: 4,
    metallic: false
  )

  TRAVELERS_SWORD = builder(
    name: "Traveler's Sword",
    description: 'A very common sword often kept by travelers to fend off small beasts. It\'s fairly durable, but a bit unreliable against monsters.',
    attack: 5,
    durability: 20,
    metallic: true
  )

end
