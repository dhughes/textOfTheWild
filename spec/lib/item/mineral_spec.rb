# frozen_string_literal: true

require 'item/mineral'

RSpec.describe Mineral do

  it 'is not edible' do
    expect(Mineral::AMBER.edible?).to eq(false)
  end

  it 'amber has value of 30' do
    expect(Mineral::AMBER.value).to be_a(Numeric)
  end
end
