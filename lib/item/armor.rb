# frozen_string_literal: true

require 'item/item'
require 'util/buildable'

class Armor < Item
  extend Buildable

  attr_accessor :defence, :type

  HEAD = 'head'
  BODY = 'body'
  LEG = 'leg'

  def initialize(name:, description:, defence:, type:)
    super(name: name, description: description)
    @defence = defence
    @type = type
  end

  FLAMEBREAKER_HELM = builder(
    name: 'Flamebreaker Helm',
    description: "Stone headgear made by Goron craftsmen to protect tourists visiting Goron City. As if its flame resistance isn't enough of a selling point, it also covers your entire head!",
    defence: 3,
    type: Armor::HEAD
  )
  HYLIAN_TUNIC = builder(
    name: 'Hylian Tunic',
    description: "A common garb that achieved widespread popularity in Hyrule, particularly among travelers. Its light-yet-sturdy fabric doesn't limit movement.",
    defence: 3,
    type: Armor::BODY
  )
  CLIMBING_BOOTS = builder(
    name: 'Climbing Boots',
    description: 'These rock-climbing boots have special no-slip toes that help you cling to walls. This ancient technology facilitates more nimble climbing.',
    defence: 3,
    type: Armor::LEG
  )
end
