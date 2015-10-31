require 'spec_helper'

describe Transformation do
  let(:transformation) { Transformation.new(x: 0, y: 1) }

  context 'attributes' do
    it 'has an x attribute of 0' do
      expect(transformation.x).to eq 0
    end

    it 'has a y attribute of 1' do
      expect(transformation.y).to eq 1
    end
  end
end
