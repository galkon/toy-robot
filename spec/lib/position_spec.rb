require 'spec_helper'

describe Position do
  let(:position) { Position.new(x: 0, y: 1) }

  context 'attributes' do
    it 'has an x attribute of 0' do
      expect(position.x).to eq 0
    end

    it 'has a y attribute of 1' do
      expect(position.y).to eq 1
    end
  end

  describe '#transform' do
    let(:transformation)    { Transformation.new(x: 1, y: 0) }
    let(:expected_position) { Position.new(x: 1, y: 1) }

    it 'adds the x and y values to the positions x and y values' do
      expect(position.transform(transformation)).to eq expected_position
    end
  end
end
