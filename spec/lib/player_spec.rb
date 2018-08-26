# frozen_string_literal: true

require 'player'
require 'errors'
require 'attack'
require 'item/ingredient'
require 'item/material'
require 'item/weapon'
require 'inventory/inventory'

RSpec.describe Player do
  it 'creates a player' do
    player = Player.new

    expect(player).to be_a(Player)
  end

  it 'has a health of 12 to start with' do
    player = Player.new

    expect(player.health).to eq(12)
  end

  it 'has has 3 hearts to start with' do
    player = Player.new

    expect(player.hearts).to eq(3)
  end

  describe '#receive_attack' do
    it 'a player can receive an attack from a weapon' do
      player = Player.new(health: 10)
      sword = Weapon::TRAVELERS_SWORD.new
      attack = Attack.new(implement: sword)

      player.receive_attack(attack)

      expect(player.health).to eq(5)
      expect(player.hearts).to eq(1.25)
    end

    context 'before the player dies' do
      it "returns the player's remaining health" do
        player = Player.new(health: 10)
        attack = Attack.new(implement: Weapon::TRAVELERS_SWORD.new)

        expect(player.receive_attack(attack)).to eq(5)
      end
    end

    context 'when the player dies' do
      it 'returns 0' do
        player = Player.new(health: 5)
        attack = Attack.new(implement: Weapon::TRAVELERS_SWORD.new)

        expect(player.receive_attack(attack)).to eq(0)
      end
    end

  end

  describe '#eat' do
    context 'when eating things that are edible' do
      it 'increases health' do
        player = Player.new(health: 4)

        player.eat(Ingredient::APPLE)

        expect(player.health).to eq(4 + Ingredient::APPLE.health)
      end

      it "only increases health to the player's hearts" do
        player = Player.new(health: 10)

        player.eat(Ingredient::BIG_HEARTY_RADISH)

        expect(player.health).to eq(player.max_health)
      end
    end

    context 'when eating something inedible' do
      it 'raises an InedibleError' do
        player = Player.new(health: 2.5)

        expect { player.eat(Material::AMBER) }.to raise_error(Errors::InedibleError)
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
