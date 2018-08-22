# frozen_string_literal: true

require 'item/item'

class Arrow < Item
  attr_accessor :attack_bonus

  def initialize(name:, description:, attack_bonus:)
    super(name: name, description: description)
    @attack_bonus = attack_bonus
  end

  ARROW = Arrow.new(
    name: 'Arrow',
    description: "A common arrow. It's shaft was carved from the wood of a sturdy tree.",
    attack_bonus: 0
  )

  class << self
    private :new
  end

end