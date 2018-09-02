# frozen_string_literal: true

require 'item/item'
require 'util/buildable'

class Weapon < Item
  extend Buildable

  attr_accessor :attack, :durability, :metallic, :bladed

  def initialize(name:, description:, attack:, durability:, metallic:, bladed:)
    super(name: name, description: description)
    @attack = attack
    @durability = durability
    @metallic = metallic
    @bladed = bladed
  end

  def metallic?
    metallic
  end

  def bladed?
    bladed
  end

  TREE_BRANCH = builder(
    name: 'Tree Branch',
    description: "Wooden branches such as this are pretty common, but it's surprisingly well-balanced. It doesn't do much damage but can serve as a weapon in a pinch.",
    attack: 2,
    durability: 4,
    metallic: false,
    bladed: false
  )
  TRAVELERS_SWORD = builder(
    name: "Traveler's Sword",
    description: 'A very common sword often kept by travelers to fend off small beasts. It\'s fairly durable, but a bit unreliable against monsters.',
    attack: 5,
    durability: 20,
    metallic: true,
    bladed: true
  )
  IRON_SLEDGEHAMMER = builder(
    name: 'Iron Sledgehammer',
    description: 'This large iron sledgehammer was originally used for mining, but it works reasonably well as a weapon too.',
    attack: 12,
    durability: 40,
    metallic: true,
    bladed: false
  )
  KNIGHTS_CLAYMORE = builder(
    name: "Knight's Claymore",
    description: "Only the most confident of Hyrule Castle's knights carried this two-handed sword. Its cutting edge is finely honed.",
    attack: 38,
    durability: 30,
    metallic: true,
    bladed: true
  )
end
