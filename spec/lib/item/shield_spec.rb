# frozen_string_literal: true

require 'item/shield'

RSpec.describe Shield do
  it 'exists' do
    shield = Shield::HYLIAN_SHIELD.new
    expect(shield).to be_a(Shield)
  end

  it 'has a durability' do
    shield = Shield::HYLIAN_SHIELD.new
    expect(shield.durability).to be_a(Numeric)
  end

  it 'is or is not metallic' do
    shield = Shield::HYLIAN_SHIELD.new
    pot_lid = Shield::POT_LID.new
    expect(shield.metallic?).to eq(true)
    expect(pot_lid.metallic?).to eq(false)
  end

  it 'has different instances of each item' do
    shield1 = Shield::HYLIAN_SHIELD.new
    shield2 = Shield::HYLIAN_SHIELD.new
    expect(shield1).not_to eq(shield2)
  end
end
