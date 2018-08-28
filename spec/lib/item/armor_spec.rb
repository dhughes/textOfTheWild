# frozen_string_literal: true

require 'item/armor'

RSpec.describe Armor do
  it 'exists' do
    expect(Armor::CLIMBING_BOOTS.new).to be_a(Armor)
  end
end
