require 'item/mineral'

RSpec.describe Mineral do

	it 'has an Amber' do
		Mineral::AMBER
	end

	it 'amber has value of 30' do
		expect(Mineral::AMBER.value).to eq(30)
	end

end
