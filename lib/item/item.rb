# frozen_string_literal: true

class Item
  attr_accessor :name, :description

  def edible?
    false
  end

  protected

  def initialize(name:, description:)
    @name = name
    @description = description
  end
end
