# frozen_string_literal: true

require 'errors'
require 'inventory/inventory'

class Player
  attr_accessor :max_health, :health, :weapons, :bows, :arrows, :shields, :armor, :ingredients, :foods, :key_items
  attr_accessor :inventories
  attr_accessor :equipped_weapon, :equipped_bow, :equipped_arrow, :equipped_shield

  def initialize(max_health: 12, health: max_health)
    @max_health = max_health
    @health = health

    @weapons = Inventory.new(max_slots: 8)
    @bows = Inventory.new(max_slots: 5)
    @arrows = Inventory.new
    @shields = Inventory.new(max_slots: 4)
    @armor = Inventory.new
    @ingredients = Inventory.new
    @foods = Inventory.new(max_slots: 60)
    @key_items = Inventory.new(max_slots: 20)
    @inventories = [weapons, bows, arrows, shields, armor, ingredients, foods, key_items]
  end

  def receive_attack(attack)
    if can_be_damaged_by_attack?(attack)
      self.health = max_health > attack.power ? health - attack.power : 0
    end

    attack.received

    health
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

  def equip(item)
    raise Errors::NotInInventoryError unless in_inventory? item
    @equipped_weapon = item if item.is_a? Weapon
    @equipped_bow = item if item.is_a? Bow
    @equipped_arrow = item if item.is_a? Arrow
    @equipped_shield = item if item.is_a? Shield
  end

  def add_to_inventory(item)
    weapons << item if item.is_a? Weapon
    bows << item if item.is_a? Bow
    arrows << item if item.is_a? Arrow
    shields << item if item.is_a? Shield
    ingredients << item if item.is_a? Ingredient
    ingredients << item if item.is_a? Material
    ingredients << item if item.is_a? Plant
  end

  private

  def in_inventory?(item)
    inventories.find do |inventory|
      inventory.include? item
    end
  end

  def can_be_damaged_by_attack?(attack)
    true
  end
end
