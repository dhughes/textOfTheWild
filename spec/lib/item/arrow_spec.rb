# frozen_string_literal: true

require 'item/arrow'

RSpec.describe Arrow do
  it 'has arrows' do
    expect(Arrow::ARROW).to be_a(Arrow)
  end
end
