require 'spec_helper'

describe Grid do
  let(:robot) { Robot.new(x: 0, y: 0, facing: :east) }
  let(:grid)  { Grid.new(robot) }

  describe 'attributes' do
    describe 'robot' do
      it 'exists' do
        expect(grid.robot).to eq robot
      end

      it 'is frozen' do
        expect(grid.robot).to be_frozen
      end
    end

    it 'has a width' do
      expect(grid.width).to eq 5
    end

    it 'has a height' do
      expect(grid.height).to eq 5
    end

    it 'has a frozen grid' do
      expect(grid.send(:grid)).to be_frozen
    end
  end
end
