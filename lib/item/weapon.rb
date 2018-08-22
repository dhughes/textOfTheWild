# frozen_string_literal: true

require 'item/item'

class Weapon < Item
  attr_accessor :attack, :durability

  def initialize(name:, description:, attack:, durability:)
    super(name: name, description: description)
    @attack = attack
    @durability = durability
  end

  TREE_BRANCH = Weapon.new(
    name: 'Tree Branch',
    description: "Wooden branches such as this are pretty common, but it's surprisingly well-balanced. It doesn't do much damage but can serve as a weapon in a pinch.",
    attack: 2,
    durability: 4
  )

  class << self
    private :new
  end

end