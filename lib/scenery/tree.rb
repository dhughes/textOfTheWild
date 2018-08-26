# frozen_string_literal: true
require 'private_attrs'
require 'item/material'
require 'item/weapon'
require 'scenery/log'

class Tree

  attr_accessor :health, :inventory, :drops

  def initialize(health:)
    @health = health
    @drops = []
  end

  def receive_attack(attack)
    if can_be_damaged_by_attack?(attack)
      self.health = self.health > attack.power ? health - attack.power : 0
    end

    if dead?
      drops << Log.new
    end

    attack.received
  end

  private

  def dead?
    self.health == 0
  end

  def can_be_damaged_by_attack?(attack)
    attack.implement.is_a?(Weapon) && attack.implement.bladed?
  end

end