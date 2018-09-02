# frozen_string_literal: true

require 'scene/scene'
require 'cli/ui'

class TextOfTheWild
  attr_accessor :scene

  def initialize
    @scene = Scene::OUTSIDE_TIME_TOMB
    # @scene.orientation = Scene::NORTH
  end

  def play
    loop do
      CLI::UI::StdoutRouter.enable
      CLI::UI::Frame.open(scene.title) do
        puts scene.describe
        do_something

      end
    end
  end

  def do_something
    action = choose_action
    target = choose_target

    puts "You want to #{action} a #{target}"
  end

  def choose_action
    CLI::UI.ask(
      'What do you want to do?',
      options: scene.list_actions
    )
  end

  def choose_target
    CLI::UI.ask(
      'To what?',
      options: scene.list_targets.map(&:to_s)
    )
  end
end

game = TextOfTheWild.new
game.play
