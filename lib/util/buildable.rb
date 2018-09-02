# frozen_string_literal: true

module Buildable
  def builder(data)
    Builder.new(self, data)
  end

  class Builder
    attr_accessor :clazz, :data

    def initialize(clazz, data)
      @clazz = clazz
      @data = data
    end

    def new
      clazz.new(data)
    end
  end
end
