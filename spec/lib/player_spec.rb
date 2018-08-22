# frozen_string_literal: true

require 'player'
require 'errors'
require 'item/ingredient'
require 'item/mineral'
require 'inventory/inventory'

RSpec.describe Player do
  it 'creates a player' do
    player = Player.new

    expect(player).to be_a(Player)
  end

  it 'has has 3 hearts to start with' do
    player = Player.new

    expect(player.hearts).to eq(3)
  end

  it 'has a health of 3 to start with' do
    player = Player.new

    expect(player.health).to eq(3)
  end

  describe '#take_damage' do
    it 'a player can take damage' do
      player = Player.new

      player.take_damage(0.5)

      expect(player.health).to eq(2.5)
    end

    it 'raises an error when the player dies' do
      player = Player.new

      expect { player.take_damage(123) }.
        to(raise_error { Errors::DeadError })
      expect(player.health).to eq(0)
    end
  end

  describe '#eat' do
    context 'when eating things that are edible' do
      it 'increases health' do
        player = Player.new(health: 1)

        player.eat(Ingredient::APPLE)

        expect(player.health).to eq(1 + Ingredient::APPLE.health)
      end

      it "only increases health to the player's hearts" do
        player = Player.new(health: 2.5)

        player.eat(Ingredient::BIG_HEARTY_RADISH)

        expect(player.health).to eq(player.hearts)
      end
    end

    context 'when eating something inedible' do
      it 'raises an InedibleError' do
        player = Player.new(health: 2.5)

        expect { player.eat(Mineral::AMBER) }.to raise_error(Errors::InedibleError)
      end
    end
  end

  it 'has a weapons inventory' do
    player = Player.new

    expect(player.weapons).to be_a(Inventory)
  end

  it 'has a bows inventory' do
    player = Player.new

    expect(player.bows).to be_a(Inventory)
  end

  it 'has an arrows inventory' do
    player = Player.new

    expect(player.arrows).to be_a(Inventory)
  end

  it 'has a shield inventory' do
    player = Player.new

    expect(player.shields).to be_a(Inventory)
  end

  it 'has an armor inventory' do
    player = Player.new

    expect(player.armor).to be_a(Inventory)
  end

  it 'has an ingredients inventory' do
    player = Player.new

    expect(player.ingredients).to be_a(Inventory)
  end

  it 'has a foods inventory' do
    player = Player.new

    expect(player.foods).to be_a(Inventory)
  end

  it 'has a key items inventory' do
    player = Player.new

    expect(player.key_items).to be_a(Inventory)
  end

  # TODO: can equip armor
  # TODO: has slate
  # TODO: slate has ruins
  # TODO: slate has memories / photos / compendium
  # TODO: there are memories to recover
  #

end
