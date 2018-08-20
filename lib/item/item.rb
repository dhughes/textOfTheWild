# frozen_string_literal: true

class Item
  attr_accessor :name, :description, :value

  def initialize(name:, description:, value:)
    @name = name
    @description = description
    @value = value
  end

  def edible?
    self.class.included_modules.include? Edible
  end
end
