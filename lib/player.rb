# frozen_string_literal: true

require 'errors'
require 'inventory/inventory'
require 'item/armor'
require 'ostruct'

class Player
  attr_accessor :max_health, :health, :weapons, :bows, :arrows, :shields, :armor, :ingredients, :foods, :key_items
  attr_accessor :inventories

  def initialize(max_health: 12, health: max_health)
    @max_health = max_health
    @health = health
    @inventories = create_inventories
  end

  def equipped
    @equipped ||= OpenStruct.new(
      weapon: nil,
      bow: nil,
      arrow: nil,
      shield: nil,
      armor: OpenStruct.new(head: nil, body: nil, leg: nil)
    )
  end

  def receive_attack(attack)
    if can_be_damaged_by_attack?(attack)
      power = mitigated_attack_power(attack)
      self.health = max_health > power ? health - power : 0
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
    equipped.weapon = item if item.is_a? Weapon
    equipped.bow = item if item.is_a? Bow
    equipped.arrow = item if item.is_a? Arrow
    equipped.shield = item if item.is_a? Shield
    equipped.armor.head = item if item.is_a?(Armor) && item.type == Armor::HEAD
    equipped.armor.body = item if item.is_a?(Armor) && item.type == Armor::BODY
    equipped.armor.leg = item if item.is_a?(Armor) && item.type == Armor::LEG
  end

  def add_to_inventory(item)
    weapons << item if item.is_a? Weapon
    bows << item if item.is_a? Bow
    arrows << item if item.is_a? Arrow
    shields << item if item.is_a? Shield
    armor << item if item.is_a? Armor
    ingredients << item if item.is_a? Material
  end

  private

  def mitigated_attack_power(attack)
    attack.power - total_defense
  end

  def total_defense
    equipped.armor.each_pair.reduce(0) { |sum, (_, armor)| sum + (armor&.defence || 0) }
  end

  def in_inventory?(item)
    inventories.find do |inventory|
      inventory.include? item
    end
  end

  def can_be_damaged_by_attack?(_attack)
    true
  end

  def create_inventories
    [@weapons = Inventory.new(max_slots: 8),
     @bows = Inventory.new(max_slots: 5),
     @arrows = Inventory.new,
     @shields = Inventory.new(max_slots: 4),
     @armor = Inventory.new,
     @ingredients = Inventory.new,
     @foods = Inventory.new(max_slots: 60),
     @key_items = Inventory.new(max_slots: 20)]
  end
end
