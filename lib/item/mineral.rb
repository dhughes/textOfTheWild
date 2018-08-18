# frozen_string_literal: true

require 'item/item'

class Mineral < Item
  attr_accessor :value

  def initialize(value:)
    @value = value
  end

  AMBER = Mineral.new(value: 30)

  class << self
    private :new
  end
end
