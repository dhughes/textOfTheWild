# frozen_string_literal: true
require 'private_attrs'
require 'item/material'

class Tree

  attr_accessor :health, :inventory, :dropped_items

  def initialize(health:)
    @health = health
  end

  def take_damage_from(damage)
    if health < damage
      self.health = 0
      @dropped_items = [Material::WOOD]
      return 0
    end

    self.health = health - damage
  end


end