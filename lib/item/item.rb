# frozen_string_literal: true

require 'item/edible'

class Item
  attr_accessor :name, :description

  def edible?
    self.class.included_modules.include? Edible
  end

  protected

  def initialize(name:, description:)
    @name = name
    @description = description
  end
end
