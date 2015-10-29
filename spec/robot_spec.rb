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
    let(:left_position) { double(:position) }

    it "turns the robot left of it's current position" do
      allow(position).to receive(:left_position) { left_position }
      robot.left
      expect(robot.position).to eq
    end
  end
end