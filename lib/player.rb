# frozen_string_literal: true

require 'errors'
require 'inventory/inventory'

class Player
  attr_accessor :hearts, :health, :weapons, :bows_and_arrows, :ingredients, :foods, :key_items

  def initialize(hearts: 3, health: 3)
    @hearts = hearts
    @health = health

    @weapons = Inventory.new(max_slots: 3)
    @bows_and_arrows = Inventory.new(max_slots: 6)
    @ingredients = Inventory.new
    @foods = Inventory.new(max_slots: 20)
    @key_items = Inventory.new(max_slots: 20)
  end

  def take_damage(damage)
    if health < damage
      self.health = 0
      raise Errors::DeadError
    end

    self.health = health - damage
  end

  def eat(edible)
    raise Errors::InedibleError, "You can't eat #{edible}" unless edible.edible?

    added_health = health + edible.health
    added_health = added_health < hearts ? added_health : hearts
    self.health = added_health
  end
end
