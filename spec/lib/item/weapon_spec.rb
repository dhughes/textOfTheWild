# frozen_string_literal: true

require 'item/weapon'

RSpec.describe Weapon do
  it 'has weapons' do
    expect(Weapon::TREE_BRANCH).to be_a(Weapon)
  end
end