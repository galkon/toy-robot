require 'spec_helper'
require 'table'
require 'robot'
require 'position'
require 'direction'

describe Table do
  let(:table)     { Table.new }
  let(:position)  { Position.new(x: 0, y: 0) }
  let(:direction) { Direction.new(:east) }
  let(:robot)     { Robot.new(position: position, direction: direction) }
  let(:grid)      { table.send(:grid) }

  describe '#place_robot' do
    it 'places the robot in the grid' do
      table.place_robot(robot)
      expect(grid[0][0]).to eq robot
    end

    context 'multiple robots' do
      let(:position_2) { Position.new(x: 1, y: 0) }
      let(:robot_2)    { Robot.new(position: position_2, direction: direction) }

      it 'only allows one robot to be placed' do
        table.place_robot(robot)
        table.place_robot(robot_2)
        expect(grid[0][0]).to be_nil
      end
    end

    context 'robot x is negative' do
      let(:position) { Position.new(x: -2, y: 0) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[position.y]).to_not include(robot)
      end
    end

    context 'robot y is negative' do
      let(:position) { Position.new(x: 0, y: -2) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[position.y]).to_not include(robot)
      end
    end

    context 'robot x is greater than 5' do
      let(:position) { Position.new(x: 8, y: 0) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[position.y]).to_not include(robot)
      end
    end

    context 'robot y is greater than 5' do
      let(:position) { Position.new(x: 0, y: 8) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[position.y]).to eq nil
      end
    end

    it 'returns nil' do
      expect(table.place_robot(robot)).to eq nil
    end
  end

  describe '#move_robot' do
    let(:position)       { Position.new(x: 2, y: 2) }
    let(:direction)      { Direction.new(:north) }
    let(:expected_robot) do
      instance_double(Robot, position: Position.new(x: 2, y: 3))
    end

    before do
      allow(robot).to receive(:moved_robot) { expected_robot }
      table.instance_variable_set('@robot', robot)
    end

    it 'places the moved robot' do
      table.move_robot
      expect(grid[3][2]).to eq expected_robot
    end
  end

  describe '#report_robots_position' do
    before { table.instance_variable_set('@robot', robot) }

    it 'returns the robots string representation' do
      expect(table.report_robots_position).to eq robot.to_s
    end
  end
end
