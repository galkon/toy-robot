require 'spec_helper'

describe Grid do
  let(:robot) { instance_double(Robot, x: 0, y: 0) }
  let(:grid) { Grid.new(robot) }

  context 'attributes' do
    it 'has a robot' do
      expect(grid.robot).to eq robot
    end

    it 'has a width' do
      expect(grid.width).to eq 5
    end

    it 'has a height' do
      expect(grid.height).to eq 5
    end
  end
end
