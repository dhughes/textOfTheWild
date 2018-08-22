# frozen_string_literal: true

require 'item/shield'

RSpec.describe Shield do
  it 'has shields' do
    expect(Shield::HYLIAN_SHIELD).to be_a(Shield)
  end
end