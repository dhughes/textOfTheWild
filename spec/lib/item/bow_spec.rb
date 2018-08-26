# frozen_string_literal: true

require 'item/bow'

RSpec.describe Bow do
  it 'exists' do
    bow = Bow::BOW_OF_LIGHT.new
    expect(bow).to be_a(Bow)
  end

  it 'has a durability' do
    bow = Bow::BOW_OF_LIGHT.new
    expect(bow.durability).to be_a(Numeric)
  end

  it 'is or is not metallic' do
    bow = Bow::BOW_OF_LIGHT.new
    pot_lid = Bow::WOODEN_BOW.new
    expect(bow.metallic?).to eq(true)
    expect(pot_lid.metallic?).to eq(false)
  end

  it 'has different instances of each item' do
    bow1 = Bow::BOW_OF_LIGHT.new
    bow2 = Bow::BOW_OF_LIGHT.new
    expect(bow1).not_to eq(bow2)
  end
end