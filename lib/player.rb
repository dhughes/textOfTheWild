# frozen_string_literal: true

require 'errors'

class Player
  attr_accessor :hearts, :health

  def initialize(hearts: 3, health: 3)
    @hearts = hearts
    @health = health
  end

  def take_damage(damage)
    if health < damage
      self.health = 0
      raise Errors::Dead
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
