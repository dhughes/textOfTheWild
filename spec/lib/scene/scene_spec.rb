# frozen_string_literal: true

require 'scene/scene'
require 'stage'
require 'player'

RSpec.describe Scene do
  it 'exists' do
    Scene.new
  end

  it 'has exits' do
    scene = Scene.new(exits: [Scene::TIME_TOMB_ENTRANCE])
    expect(scene.exits).to include(Scene::TIME_TOMB_ENTRANCE)
  end

  describe '#exit' do
    # types of exits require types of actions.
    # EG: walking into the time tomb
    # EG: climbing down or jumping off a cliff
    # EG: climbing up a cliff
    # EG: swimming into water

    it 'can walk to another scene' do
      OUTSIDE_TIME_TOMB.exit(Action::WALK, Scene::TIME_TOMB_ENTRANCE)


    end
  end


end
