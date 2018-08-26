# frozen_string_literal: true

require 'item/weapon'

RSpec.describe Weapon do
  it 'exists' do
    tree_branch = Weapon::TREE_BRANCH.new
    expect(tree_branch ).to be_a(Weapon)
  end

  it 'has attack power' do
    tree_branch = Weapon::TREE_BRANCH.new
    expect(tree_branch.attack).to be_a(Numeric)
  end

  it 'has a durability' do
    tree_branch = Weapon::TREE_BRANCH.new
    expect(tree_branch.durability).to be_a(Numeric)
  end

  it 'is or is not metallic' do
    tree_branch = Weapon::TREE_BRANCH.new
    sword = Weapon::TRAVELERS_SWORD.new
    expect(tree_branch.metallic?).to eq(false)
    expect(sword.metallic?).to eq(true)
  end

  it 'has different instances of each item' do
    sword1 = Weapon::TRAVELERS_SWORD.new
    sword2 = Weapon::TRAVELERS_SWORD.new
    expect(sword1).not_to eq(sword2)
  end
end