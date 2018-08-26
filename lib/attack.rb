# frozen_string_literal: true

class Attack

  attr_accessor :implement, :modifier

  def initialize(implement:, modifier: nil)
    @implement = implement
    @modifier = modifier
  end

  def power
    implement.attack + modifier_attack
  end

  def received
    implement.durability = implement.durability - 1
  end

  private

  def modifier_attack
    modifier&.attack || 0
  end
end