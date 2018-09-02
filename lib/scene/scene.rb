# frozen_string_literal: true

require 'scene/setting'
require 'scenery/tree'

class Scene
  attr_accessor :altitude, :setting, :layout, :from_distance

  NORTH = 'north'
  NORTH_EAST = 'north east'
  EAST = 'east'
  SOUTH_EAST = 'south east'
  SOUTH = 'south'
  SOUTH_WEST = 'south west'
  WEST = 'west'
  NORTH_WEST = 'north west'

  def initialize(altitude:, setting:, from_distance:)
    @altitude = altitude
    @setting = setting
    @from_distance = from_distance
  end

  def describe
    description = [setting, layout.map { |_, things| things.map(&:describe) }].flatten.join(' ')
    "You stand #{description}"
  end

  def describe_from_distance
    from_distance
  end

  def list_actions
    layout.map { |_, things| things.map(&:list_available_actions) }.
      flatten.
      uniq
  end

  def list_targets
    layout.map { |_, things| things }.
      flatten.
      uniq
  end

  class Cliff
    def initialize(to_scene, direction)
      @to_scene = to_scene
      @direction = direction
    end

    def self.to(scene, from_altitude)
      new(scene, from_altitude > scene.altitude ? 'down' : 'up')
    end

    def list_available_actions
      if @direction == 'down'
        ['Jump', 'Climb']
      else
        ['Climb']
      end
    end

    def describe
      if @direction == 'down'
        "A cliff drops sharply down to #{@to_scene.describe_from_distance}"
      else
        'A sheer rock wall rises steeply above you.'
      end
    end
  end
  class Opening
    def initialize(to_scene)
      @to_scene = to_scene
    end

    def self.to(scene)
      new(scene)
    end

    def list_available_actions
      ['Enter']
    end

    def describe
      "An opening to #{@to_scene.describe_from_distance}"
    end
  end
  class Path
    def initialize(to_scene)
      @to_scene = to_scene
    end

    def self.to(scene)
      new(scene)
    end

    def list_available_actions
      ['Walk']
    end

    def describe
      "A path to #{@to_scene.describe_from_distance}"
    end
  end

  FIELD1 = Scene.new(
    altitude: 50,
    setting: 'in the shadow of a sheer rock wall',
    from_distance: 'a clearing dotted with a few trees.'
  )
  FIELD2 = Scene.new(
    altitude: 150,
    setting: 'at the top of a mighty cliff. You can see very far from here.',
    from_distance: 'an open grassy field on the top of a mountain.'
  )
  FIELD3 = Scene.new(
    altitude: 125,
    setting: 'on a path that slopes gently downhill to the south east.',
    from_distance: 'a gently sloping grassy path.'
  )
  TIME_TOMB = Scene.new(
    altitude: 100,
    setting: 'in a dark room.',
    from_distance: 'a dark tunnel.'
  )
  OUTSIDE_TIME_TOMB = Scene.new(
    altitude: 100,
    setting: 'in a grassy field.',
    from_distance: 'a grassy field jutting out into a cliff face that drops sharply below.'
  )

  FIELD1.layout = {
    SOUTH: [Cliff.to(OUTSIDE_TIME_TOMB, FIELD1.altitude)]
  }
  FIELD2.layout = {
    NORTH: [Cliff.to(OUTSIDE_TIME_TOMB, FIELD2.altitude)]
  }
  FIELD3.layout = {
    NORTH_WEST: [Path.to(OUTSIDE_TIME_TOMB)]
  }
  TIME_TOMB.layout = {
    NORTH: [Opening.to(OUTSIDE_TIME_TOMB)]
  }
  OUTSIDE_TIME_TOMB.layout = {
    NORTH: [Cliff.to(FIELD1, OUTSIDE_TIME_TOMB.altitude)],
    SOUTH: [Cliff.to(FIELD2, OUTSIDE_TIME_TOMB.altitude), Opening.to(TIME_TOMB)],
    SOUTH_EAST: [Tree.new(health: 6), Tree.new(health: 6), Tree.new(health: 6), Tree.new(health: 6), Tree.new(health: 6), Path.to(FIELD3)]
  }
end
