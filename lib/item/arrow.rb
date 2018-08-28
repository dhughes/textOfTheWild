# frozen_string_literal: true

require 'item/item'

class Arrow < Item
  attr_accessor :attack

  def initialize(name:, description:, attack:)
    super(name: name, description: description)
    @attack = attack
  end

  ARROW = Arrow.new(
    name: 'Arrow',
    description: "A common arrow. It's shaft was carved from the wood of a sturdy tree.",
    attack: 2
  )

  class << self
    private :new
  end
end
