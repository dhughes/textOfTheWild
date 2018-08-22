# frozen_string_literal: true

require 'scenery/tree'
require 'item/ingredient'
require 'errors'

RSpec.describe Tree do

  describe '#take_damage' do
    it 'a tree can take damage' do
      tree = Tree.new(health: 5)

      tree.take_damage(2)

      expect(tree.health).to eq(3)
    end

    context 'before a tree dies' do
      it "returns the tree's remaining health" do
        tree = Tree.new(health: 5)

        expect(tree.take_damage(2)).to eq(3)
      end

      it 'has no dropped items' do
        tree = Tree.new(health: 5)
        expect(tree.dropped_items).to be_nil
      end
    end

    context 'when a tree dies (is chopped down)' do
      it 'returns 0' do
        tree = Tree.new(health: 5)

        expect(tree.take_damage(6)).to eq(0)
      end

      it 'drops items' do
        tree = Tree.new(health: 5)

        tree.take_damage(6)

        expect(tree.dropped_items.first).to eq(Material::WOOD)
      end
    end
  end

end

