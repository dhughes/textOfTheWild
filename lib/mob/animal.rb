# frozen_string_literal: true

require 'util/buildable'

class Animal
  extend Buildable

  attr_accessor :name, :description

  def initialize(name:, description:)
    @name = name
    @description = description
  end

  WOODLAND_BOAR = builder(
    name: 'Woodland Boar',
    description: "These medium-sized beasts can be found all throughout Hyrule. You can most often find them foraging for food in forests or meadows. Although usually docile, they won't hesitate to charge you full force if you get too close."
  )
end
