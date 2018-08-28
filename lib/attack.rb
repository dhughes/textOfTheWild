# frozen_string_literal: true

class Attack
  attr_accessor :base_attack, :implement, :modifier

  def initialize(base_attack: 0, implement: nil, modifier: nil)
    @base_attack = base_attack
    @implement = implement
    @modifier = modifier
  end

  def power
    base_attack + implement_attack + modifier_attack
  end

  def received
    implement.durability = implement.durability - 1
  end

  private

  def implement_attack
    implement&.attack || 0
  end

  def modifier_attack
    modifier&.attack || 0
  end
end
