require 'spec_helper'
require 'robot'
require 'position'
require 'direction'

describe Robot do
  let(:direction_value) { :east }
  let(:x)               { 0 }
  let(:y)               { 1 }
  let(:robot)           { Robot.new(x: x, y: y, facing: direction_value) }
  let(:direction)       { robot.send(:direction) }

  describe '#left_robot' do
    let(:left_direction) { instance_double(Direction, value: :east) }
    let(:expected_robot) do
      Robot.new(x: x, y: y, facing: left_direction.value)
    end

    before do
      allow(direction).to receive(:left_direction) { left_direction }
    end

    it 'returns a new robot with a left direction' do
      expect(robot.left_robot).to eq expected_robot
    end
  end

  describe '#right_robot' do
    let(:right_direction) { instance_double(Direction, value: :north) }
    let(:expected_robot) do
      Robot.new(x: x, y: y, facing: right_direction.value)
    end

    before do
      allow(direction).to receive(:right_direction) { right_direction }
    end

    it 'returns a new robot with a right direction' do
      expect(robot.right_robot).to eq expected_robot
    end
  end

  describe '#moved_robot' do
    let(:x) { 2 }
    let(:y) { 2 }

    let(:expected_robot) do
      Robot.new(x: new_x, y: new_y, facing: direction_value)
    end

    context 'east direction' do
      let(:direction_value) { :east }
      let(:new_x) { 3 }
      let(:new_y) { 2 }

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
