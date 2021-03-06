# frozen_string_literal: true

require 'player'
require 'errors'
require 'attack'
require 'item/material'
require 'item/weapon'
require 'item/bow'
require 'item/arrow'
require 'item/shield'
require 'item/armor'
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
    it 'can receive an attack from a weapon' do
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

    context 'when wearing armor' do
      it 'lessens the impact of the attack' do
        player = Player.new(health: 10)
        player.add_to_inventory(head_armor = Armor::FLAMEBREAKER_HELM.new)
        player.add_to_inventory(body_armor = Armor::HYLIAN_TUNIC.new)
        player.add_to_inventory(leg_armor = Armor::CLIMBING_BOOTS.new)
        player.equip(head_armor)
        player.equip(body_armor)
        player.equip(leg_armor)

        sword = Weapon::IRON_SLEDGEHAMMER.new
        attack = Attack.new(base_attack: 4, implement: sword)

        player.receive_attack(attack)

        expect(player.health).to eq(3)
      end
    end
  end

  describe '#eat' do
    context 'when eating things that are edible' do
      it 'increases health' do
        player = Player.new(health: 4)

        player.eat(Material::APPLE)

        expect(player.health).to eq(4 + Material::APPLE.health)
      end

      it "only increases health to the player's hearts" do
        player = Player.new(health: 10)

        player.eat(Material::BIG_HEARTY_RADISH)

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

  describe '#equip' do
    it 'can equip a weapon' do
      player = Player.new
      sword = Weapon::TRAVELERS_SWORD.new
      player.weapons.add(sword)

      player.equip(sword)

      expect(player.equipped.weapon).to be(sword)
    end

    it 'can only equip a weapon in the inventory' do
      player = Player.new
      sword = Weapon::TRAVELERS_SWORD.new

      expect do
        player.equip(sword)
      end.to raise_error(Errors::NotInInventoryError)
    end

    it 'can equip a bow' do
      player = Player.new
      bow = Bow::WOODEN_BOW.new
      player.bows.add(bow)

      player.equip(bow)

      expect(player.equipped.bow).to be(bow)
    end

    it 'can equip an arrow' do
      player = Player.new
      arrow = Arrow::ARROW
      player.add_to_inventory(arrow)

      player.equip(arrow)

      expect(player.equipped.arrow).to be(arrow)
    end

    it 'can equip a shield' do
      player = Player.new
      item = Shield::POT_LID.new
      player.add_to_inventory(item)

      player.equip(item)

      expect(player.equipped.shield).to be(item)
    end

    it 'can equip head armor' do
      player = Player.new
      item = Armor::FLAMEBREAKER_HELM.new
      player.add_to_inventory(item)

      player.equip(item)

      expect(player.equipped.armor.head).to be(item)
    end

    it 'can equip body armor' do
      player = Player.new
      item = Armor::HYLIAN_TUNIC.new
      player.add_to_inventory(item)

      player.equip(item)

      expect(player.equipped.armor.body).to be(item)
    end

    it 'can equip leg armor' do
      player = Player.new
      item = Armor::CLIMBING_BOOTS.new
      player.add_to_inventory(item)

      player.equip(item)

      expect(player.equipped.armor.leg).to be(item)
    end
  end

  describe '#add_to_inventory' do
    it 'can add a weapon to the weapons inventory' do
      player = Player.new
      sword = Weapon::TRAVELERS_SWORD.new
      player.add_to_inventory(sword)

      expect(player.weapons).to include(sword)
    end

    it 'can add a bow to the bows inventory' do
      player = Player.new
      bow = Bow::BOW_OF_LIGHT.new
      player.add_to_inventory(bow)

      expect(player.bows).to include(bow)
    end

    it 'can add an arrow to the arrows inventory' do
      player = Player.new
      item = Arrow::ARROW
      player.add_to_inventory(item)

      expect(player.arrows).to include(item)
    end

    it 'can add a shield to the shields inventory' do
      player = Player.new
      item = Shield::POT_LID.new
      player.add_to_inventory(item)

      expect(player.shields).to include(item)
    end

    it 'can add an armor to the armor inventory' do
      player = Player.new
      head_armor = Armor::FLAMEBREAKER_HELM.new
      body_armor = Armor::HYLIAN_TUNIC.new
      leg_armor = Armor::CLIMBING_BOOTS.new
      player.add_to_inventory(head_armor)
      player.add_to_inventory(body_armor)
      player.add_to_inventory(leg_armor)

      expect(player.armor).to include(head_armor, body_armor, leg_armor)
    end

    it 'can add an ingredient to the ingredients inventory' do
      player = Player.new
      item = Material::APPLE
      player.add_to_inventory(item)

      expect(player.ingredients).to include(item)
    end

    it 'can add a material to the ingredients inventory' do
      player = Player.new
      item = Material::WOOD
      player.add_to_inventory(item)

      expect(player.ingredients).to include(item)
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

  # TODO: has slate
  # TODO: slate has ruins
  # TODO: slate has memories / photos / compendium
  # TODO: there are memories to recover
end
