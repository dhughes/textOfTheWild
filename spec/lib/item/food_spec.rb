# frozen_string_literal: true

require 'item/food'

RSpec.describe Food do

  it 'is edible' do
    expect(Ingredient::APPLE.edible?).to eq(true)
  end

  it 'has health' do
    expect(Ingredient::APPLE.health).to be_a(Numeric)
  end

  it 'has a name' do
    expect(Ingredient::APPLE.name).to be_a(String)
  end

  it 'has a description' do
    expect(Ingredient::APPLE.description).to be_a(String)
  end
end