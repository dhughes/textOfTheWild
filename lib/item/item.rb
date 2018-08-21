# frozen_string_literal: true

class Item
  attr_accessor :name, :description, :value

  def edible?
    self.class.included_modules.include? Edible
  end

  protected

  def initialize(name:, description:, value:)
    @name = name
    @description = description
    @value = value
  end
end
