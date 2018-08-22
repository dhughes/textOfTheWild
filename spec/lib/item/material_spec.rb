# frozen_string_literal: true

require 'item/material'

RSpec.describe Material do
  it 'is not edible' do
    expect(Material::AMBER.edible?).to eq(false)
  end

  it 'amber has value of 30' do
    expect(Material::AMBER.value).to be_a(Numeric)
  end
end
