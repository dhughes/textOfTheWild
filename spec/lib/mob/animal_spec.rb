# frozen_string_literal: true

require 'mob/animal'

RSpec.describe Animal do

  it 'has a name and description' do
    Animal.new(name: "Cow", description: "Friendly, with a big wet nose.")
  end
end
