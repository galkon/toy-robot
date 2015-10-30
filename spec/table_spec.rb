require 'table'
require 'robot'
require 'position'
require 'direction'

describe Table do
  let(:table)     { Table.new }
  let(:position)  { Position.new(x: 0, y: 0) }
  let(:direction) { Direction.new(:east) }
  let(:robot)     { Robot.new(position: position, direction: direction) }

  describe "#place_robot" do
    it "places the robot in the grid" do
      table.place_robot(robot)
      expect(table.grid[0][0]).to eq robot
    end

    context "multiple robots" do
      let(:position_2) { Position.new(x: 1, y: 0) }
      let(:robot_2)    { Robot.new(position: position_2, direction: direction) }

      it "only allows one robot to be placed" do
        table.place_robot(robot)
        table.place_robot(robot_2)
        expect(table.grid[0][0]).to be_nil
      end
    end

    context "robot is out of upper y bounds" do
      let(:position) { Position.new(x: 0, y: 6) }

      it "silently fails" do
        expect { table.place_robot(robot) }.to_not raise_error
      end
    end

    context "robot is out of upper x bounds" do
      let(:position) { Position.new(x: 6, y: 0) }

      it "silently fails" do
        expect { table.place_robot(robot) }.to_not raise_error
      end
    end

    context "robot is out of lower x bounds" do
      let(:position) { Position.new(x: -1, y: 0) }

      it "silently fails" do
        expect { table.place_robot(robot) }.to_not raise_error
      end
    end

    context "robot is out of lower y bounds" do
      let(:position) { Position.new(x: 0, y: -1) }

      it "silently fails" do
        expect { table.place_robot(robot) }.to_not raise_error
      end
    end

    it "returns self" do
      expect(table.place_robot(robot)).to eq table
    end
  end
end