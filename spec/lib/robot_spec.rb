require 'spec_helper'

describe Robot do
  let(:direction_value) { :east }
  let(:x)               { 0 }
  let(:y)               { 1 }
  let(:robot)           { Robot.new(x: x, y: y, facing: direction_value) }
  let(:direction)       { robot.send(:direction) }

  describe 'attributes' do
    describe 'position' do
      it 'should be frozen' do
        expect(robot.send(:position)).to be_frozen
      end
    end

    describe 'direction' do
      it 'should be frozen' do
        expect(robot.send(:direction)).to be_frozen
      end
    end
  end

  describe '#left_robot' do
    let(:expected_robot) { Robot.new(x: x, y: y, facing: :north) }

    it 'returns a frozen object' do
      expect(robot.left_robot).to be_frozen
    end

    it 'returns a new robot with a left direction' do
      expect(robot.left_robot).to eq expected_robot
    end
  end

  describe '#right_robot' do
    let(:expected_robot) { Robot.new(x: x, y: y, facing: :south) }

    it 'returns a frozen object' do
      expect(robot.right_robot).to be_frozen
    end

    it 'returns a new robot with a right direction' do
      expect(robot.right_robot).to eq expected_robot
    end
  end

  describe '#moved_robot' do
    let(:x) { 2 }
    let(:y) { 2 }
    let(:new_x) { 3 }
    let(:new_y) { 2 }

    let(:expected_robot) do
      Robot.new(x: new_x, y: new_y, facing: direction_value)
    end

    it 'returns a frozen object' do
      expect(robot.moved_robot).to be_frozen
    end

    context 'east direction' do
      let(:direction_value) { :east }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end

    context 'north direction' do
      let(:direction_value) { :north }
      let(:new_x) { 2 }
      let(:new_y) { 3 }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end

    context 'west direction' do
      let(:direction_value) { :west }
      let(:new_x) { 1 }
      let(:new_y) { 2 }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end

    context 'south direction' do
      let(:direction_value) { :south }
      let(:new_x) { 2 }
      let(:new_y) { 1 }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end
  end

  describe '#x' do
    it 'delegates #x to #position.x' do
      expect(robot.x).to eq x
    end
  end

  describe '#y' do
    it 'delegates #y to #position.y' do
      expect(robot.y).to eq y
    end
  end

  describe '#to_s' do
    let(:expected_output) do
      'Robot: [x = 0, y = 1, facing = east]'
    end

    it 'prints the robots state' do
      expect(robot.to_s).to eq expected_output
    end
  end
end
