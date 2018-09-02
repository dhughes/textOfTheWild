# frozen_string_literal: true

require 'scene/scene'

class TextOfTheWild
  attr_accessor :scene

  def initialize
    @scene = Scene::OUTSIDE_TIME_TOMB
    # @scene.orientation = Scene::NORTH
  end

  def play
    puts scene.describe
    do_something

    # loop do
    #   STARTING_SCENE.describe
    # end
  end

  def do_something
    action = choose_action
    target = choose_target
  end

  def choose_action
    puts 'What do you want to do?'
    scene.list_actions.each { |action| puts "- #{action}" }
    print ': '
    gets
  end

  def choose_target
    scene.list_targets.each { |target| puts "- #{target}" }
  end
end

game = TextOfTheWild.new
game.play
