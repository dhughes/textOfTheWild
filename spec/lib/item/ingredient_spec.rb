# frozen_string_literal: true

require 'item/ingredient'

RSpec.describe Ingredient do
  it 'has an apple' do
    Ingredient::APPLE
  end

  it 'apple has health of 0.5' do
    expect(Ingredient::APPLE.health).to eq(0.5)
  end

  it 'has a name' do
    expect(Ingredient::APPLE.name).to be_a(String)
  end

  it 'has a description' do
    expect(Ingredient::APPLE.description).to be_a(String)
  end

  it 'has a value' do
    expect(Ingredient::APPLE.value).to be_a(Numeric)
  end
end
