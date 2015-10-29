require 'robot'
require 'position'
require 'direction'

describe Robot do
  let(:position)  { Position.new(0, 1) }
  let(:direction) { Direction.new(:east) }
  let(:robot)     { Robot.new(position, direction) }

  context "attributes" do
    it "has a position" do
      expect(robot.position).to eq position
    end

    it "has a direction attribute" do
      expect(robot.direction).to eq direction
    end
  end

  describe "#left" do
    let(:left_direction) { instance_double(Direction) }

    it "turns the robot left of it's current position" do
      allow(direction).to receive(:left_direction) { left_direction }
      robot.left
      expect(robot.direction).to eq left_direction
    end
  end

  describe "#right" do
    let(:right_direction) { instance_double(Direction) }

    it "turns the robot right of it's current position" do
      allow(direction).to receive(:right_direction) { right_direction }
      robot.right
      expect(robot.direction).to eq right_direction
    end
  end
end