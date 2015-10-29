require 'robot'

describe Robot do
  let(:robot) { Robot.new(0, 1, :east) }

  context "attributes" do
    it "has a x attribute of 0" do
      expect(robot.x).to eq 0
    end

    it "has a y attribute of 1" do
      expect(robot.y).to eq 1
    end

    it "has a facing attribute of east" do
      expect(robot.facing).to eq :east
    end
  end
end