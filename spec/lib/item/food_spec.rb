# frozen_string_literal: true

require 'item/food'

RSpec.describe Food do

  it 'is edible' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.edible?).to eq(true)
  end

  it 'has health' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.health).to be_a(Numeric)
  end

  it 'has a name' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.name).to be_a(String)
  end

  it 'has a description' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.description).to be_a(String)
  end
end
