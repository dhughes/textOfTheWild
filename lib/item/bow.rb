# frozen_string_literal: true

require 'item/item'

class Bow < Item
  attr_accessor :attack, :durability, :range

  def initialize(name:, description:, attack:, durability:, range:)
    super(name: name, description: description)
    @attack = attack
    @durability = durability
  end

  BOW_OF_LIGHT = Bow.new(
    name: 'Bow of Light',
    description: 'Princess Zelda gave you this bow and arrow for the battle with Dark beast Ganon. When wielded by the hero, it fires arrows of pure light strong enough to oppose the Calamity.',
    attack: 100,
    durability: 100,
    range: 500
  )

  class << self
    private :new
  end

end