# frozen_string_literal: true

require 'item/food'

RSpec.describe Food do
  it 'is edible' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.new.edible?).to eq(true)
  end

  it 'has health' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.new.health).to be_a(Numeric)
  end

  it 'has a name' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.new.name).to be_a(String)
  end

  it 'has a description' do
    expect(Food::FISH_AND_MUSHROOM_SKEWER.new.description).to be_a(String)
  end
end
