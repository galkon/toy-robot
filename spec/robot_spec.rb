require 'robot'
require 'position'

describe Robot do
  let(:position) { Position.new(0, 1) }
  let(:robot) { Robot.new(position, :east) }

  context "attributes" do

    it "has a position" do
      expect(robot.position).to eq position
    end

    it "has a facing attribute of east" do
      expect(robot.facing).to eq :east
    end
  end
end