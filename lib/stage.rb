# frozen_string_literal: true

class Stage

  attr_accessor :player, :scene, :mobs

  def initialize(player:, scene:, mobs: [])
    @player = player
    @scene = scene
    @mobs = mobs
  end

end