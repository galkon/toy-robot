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

    it "has a direction" do
      expect(robot.direction).to eq direction
    end
  end

  describe "#left" do
    let(:left_direction) { instance_double(Direction) }

    before { allow(direction).to receive(:left_direction) { left_direction } }

    it "turns the robot left of it's current position" do
      robot.left
      expect(robot.direction).to eq left_direction
    end

    it "returns self" do
      expect(robot.left).to eq robot
    end
  end

  describe "#right" do
    let(:right_direction) { instance_double(Direction) }

    before { allow(direction).to receive(:right_direction) { right_direction } }

    it "turns the robot right of it's current position" do
      robot.right
      expect(robot.direction).to eq right_direction
    end

    it "returns self" do
      expect(robot.right).to eq robot
    end
  end

  describe "#to_s" do
    let(:position)  { "position" }
    let(:direction) { "direction" }

    before do
      allow(position).to receive(:to_s) { position }
      allow(direction).to receive(:to_s) { direction }
    end

    it "prints the robots state" do
      expect(robot.to_s).to eq "Position: [#{position}], Direction: [#{direction}]"
    end
  end
end