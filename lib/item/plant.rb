# frozen_string_literal: true

require 'item/item'
require 'item/edible'

class Plant < Item
  attr_accessor :name, :description, :value

  def initialize(name:, description:, value:)
    super(name: name, description: description)
    @value = value
  end

  ARMORANTH = Plant.new(
    name: 'Armoranth',
    description: 'This tough medicinal plant cannot be broken, but it can be cooked. Its durable yet flexible fibers raise your defense when cooked into a dish.',
    value: 5
  )

  class << self
    private :new
  end
end
