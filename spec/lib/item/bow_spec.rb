# frozen_string_literal: true

require 'item/bow'

RSpec.describe Bow do
  it 'has bows' do
    expect(Bow::BOW_OF_LIGHT).to be_a(Bow)
  end
end