require 'robot'
require 'position'
require 'direction'

describe Robot do
  let(:direction_value) { :east }
  let(:position)        { Position.new(x: 0, y: 0) }
  let(:direction)       { Direction.new(direction_value) }
  let(:robot)           { Robot.new(position: position, direction: direction) }

  context 'attributes' do
    it 'has a position' do
      expect(robot.position).to eq position
    end

    it 'has a direction' do
      expect(robot.direction).to eq direction
    end
  end

  describe '#left_robot' do
    let(:left_direction) { instance_double(Direction) }
    let(:expected_robot) do
      Robot.new(position: position, direction: left_direction)
    end

    before do
      allow(direction).to receive(:left_direction) { left_direction }
    end

    it 'returns a new robot with a left direction' do
      expect(robot.left_robot).to eq expected_robot
    end
  end

  describe '#right_robot' do
    let(:right_direction) { instance_double(Direction) }
    let(:expected_robot) do
      Robot.new(position: position, direction: right_direction)
    end

    before do
      allow(direction).to receive(:right_direction) { right_direction }
    end

    it 'returns a new robot with a right direction' do
      expect(robot.right_robot).to eq expected_robot
    end
  end

  describe '#moved_robot' do
    let(:position) { Position.new(x: 2, y: 2) }

    let(:expected_robot) do
      Robot.new(position: new_position, direction: direction)
    end

    context 'east direction' do
      let(:direction_value) { :east }
      let(:new_position)    { Position.new(x: 3, y: 2) }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end

    context 'north direction' do
      let(:direction_value) { :north }
      let(:new_position) { Position.new(x: 2, y: 3) }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end

    context 'west direction' do
      let(:direction_value) { :west }
      let(:new_position) { Position.new(x: 1, y: 2) }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end

    context 'south direction' do
      let(:direction_value) { :south }
      let(:new_position) { Position.new(x: 2, y: 1) }

      it 'sets the position to the expected_position' do
        expect(robot.moved_robot).to eq expected_robot
      end
    end
  end

  describe '#to_s' do
    let(:position)  { 'position' }
    let(:direction) { 'direction' }
    let(:expected_output) do
      "Position: [#{position}], Direction: [#{direction}]"
    end

    before do
      allow(position).to receive(:to_s) { position }
      allow(direction).to receive(:to_s) { direction }
    end

    it 'prints the robots state' do
      expect(robot.to_s).to eq expected_output
    end
  end
end
