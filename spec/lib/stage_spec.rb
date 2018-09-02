# frozen_string_literal: true

require 'stage'
require 'player'
require 'scene/scene'
require 'mob/animal'

RSpec.describe Stage do

  it 'has a player, scene, and exits to other scenes' do
    player = Player.new
    outside = Scene::OUTSIDE_TIME_TOMB
    stage = Stage.new(player: player, scene: outside)

    expect(stage.player).to be(player)
    expect(stage.scene).to be(outside)
  end

  context 'when there are mobs' do
    it 'has mobs' do
      player = Player.new
      outside = Scene::OUTSIDE_TIME_TOMB
      boar = Animal::WOODLAND_BOAR.new
      stage = Stage.new(player: player, scene: outside, mobs: [boar])

      expect(stage.player).to be(player)
      expect(stage.scene).to be(outside)
      expect(stage.mobs).to include(boar)
    end
  end


end