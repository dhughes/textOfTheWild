# frozen_string_literal: true

require 'errors'
require 'inventory/inventory'

class Player
  attr_accessor :max_health, :health, :weapons, :bows, :arrows, :shields, :armor, :ingredients, :foods, :key_items

  def initialize(max_health: 12, health: max_health)
    @max_health = max_health
    @health = health

    @weapons = Inventory.new(max_slots: 8)
    @bows = Inventory.new(max_slots: 5)
    @arrows = Inventory.new
    @shields = Inventory.new(max_slots: 4)
    @armor = Inventory.new # TODO: is there a max for armor you can cary?
    @ingredients = Inventory.new
    @foods = Inventory.new(max_slots: 60)
    @key_items = Inventory.new(max_slots: 20)
  end

  def receive_attack(attack)
    if can_be_damaged_by_attack?(attack)
      self.health = max_health > attack.power ? health - attack.power : 0
    end

    attack.received

    self.health
  end

  def hearts
    health / 4.0
  end

  def eat(edible)
    raise Errors::InedibleError, "You can't eat #{edible}" unless edible.edible?

    self.health = if health + edible.health < max_health
                    health + edible.health
                  else
                    max_health
                  end

  end

  private

  def can_be_damaged_by_attack?(attack)
    true
  end
end
