require 'spec_helper'
require 'direction'

describe Direction do
  let(:value)     { :east }
  let(:direction) { Direction.new(value) }

  context 'attributes' do
    it 'has a value of east' do
      expect(direction.value).to eq :east
    end
  end

  describe '#left_direction' do
    context 'direction is north' do
      let(:value)              { :north }
      let(:expected_direction) { Direction.new(:west) }

      it 'returns a west direction object' do
        expect(direction.left_direction).to eq expected_direction
      end
    end

    context 'direction is east' do
      let(:value)              { :east }
      let(:expected_direction) { Direction.new(:north) }

      it 'returns a north direction object' do
        expect(direction.left_direction).to eq expected_direction
      end
    end

    context 'direction is south' do
      let(:value)              { :south }
      let(:expected_direction) { Direction.new(:east) }

      it 'returns a east direction object' do
        expect(direction.left_direction).to eq expected_direction
      end
    end

    context 'direction is west' do
      let(:value)              { :west }
      let(:expected_direction) { Direction.new(:south) }

      it 'returns a south direction object' do
        expect(direction.left_direction).to eq expected_direction
      end
    end
  end

  describe '#right_direction' do
    context 'direction is north' do
      let(:value)              { :north }
      let(:expected_direction) { Direction.new(:east) }

      it 'returns a east direction object' do
        expect(direction.right_direction).to eq expected_direction
      end
    end

    context 'direction is east' do
      let(:value)              { :east }
      let(:expected_direction) { Direction.new(:south) }

      it 'returns a south direction object' do
        expect(direction.right_direction).to eq expected_direction
      end
    end

    context 'direction is south' do
      let(:value)              { :south }
      let(:expected_direction) { Direction.new(:west) }

      it 'returns a west direction object' do
        expect(direction.right_direction).to eq expected_direction
      end
    end

    context 'direction is west' do
      let(:value)              { :west }
      let(:expected_direction) { Direction.new(:north) }

      it 'returns a north direction object' do
        expect(direction.right_direction).to eq expected_direction
      end
    end
  end

  describe '#transformation' do
    context 'direction is west' do
      let(:value) { :west }
      let(:expected_transformation) { Transformation.new(x: -1, y: 0) }

      it 'returns the correct transformation for west' do
        expect(direction.transformation).to eq expected_transformation
      end
    end

    context 'direction is north' do
      let(:value) { :north }
      let(:expected_transformation) { Transformation.new(x: 0, y: 1) }

      it 'returns the correct transformation for north' do
        expect(direction.transformation).to eq expected_transformation
      end
    end

    context 'direction is east' do
      let(:value) { :east }
      let(:expected_transformation) { Transformation.new(x: 1, y: 0) }

      it 'returns the correct transformation for east' do
        expect(direction.transformation).to eq expected_transformation
      end
    end

    context 'direction is south' do
      let(:value) { :south }
      let(:expected_transformation) { Transformation.new(x: 0, y: -1) }

      it 'returns the correct transformation for south' do
        expect(direction.transformation).to eq expected_transformation
      end
    end
  end
end
