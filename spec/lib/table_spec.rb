require 'spec_helper'

describe Table do
  let(:table)     { Table.new }
  let(:robot)     { instance_double(Robot, x: 0, y: 0) }
  let(:grid)      { table.send(:grid) }

  describe '#place_robot' do
    before { table.place_robot(robot) }

    it 'places the robot in the grid' do
      expect(grid[0][0]).to eq robot
    end

    it 'sets @robot' do
      expect(table.instance_variable_get('@robot')).to eq robot
    end

    context 'multiple robots' do
      let(:robot_2) { instance_double(Robot, x: 1, y: 0) }

      before { allow(robot).to receive(:is_a?).with(Robot) { true } }

      it 'only allows one robot to be placed' do
        table.place_robot(robot_2)
        expect(grid[robot.y][robot.x]).to be_nil
      end
    end

    context 'robot x is negative' do
      let(:robot) { instance_double(Robot, x: -2, y: 0) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[robot.y]).to_not include(robot)
      end
    end

    context 'robot y is negative' do
      let(:robot) { instance_double(Robot, x: 0, y: -2) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[robot.y]).to_not include(robot)
      end
    end

    context 'robot x is greater than 5' do
      let(:robot) { instance_double(Robot, x: 8, y: 0) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[robot.y]).to_not include(robot)
      end
    end

    context 'robot y is greater than 5' do
      let(:robot) { instance_double(Robot, x: 0, y: 8) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(grid[robot.y]).to eq nil
      end
    end

    it 'returns nil' do
      expect(table.place_robot(robot)).to eq nil
    end
  end

  describe '#place_moved_robot' do
    let(:expected_robot) do
      instance_double(Robot, x: 2, y: 3)
    end

    before do
      allow(robot).to receive(:moved_robot) { expected_robot }
      table.instance_variable_set('@robot', robot)
    end

    it 'places the moved robot' do
      table.place_moved_robot
      expect(grid[expected_robot.y][expected_robot.x]).to eq expected_robot
    end
  end

  describe '#place_turned_robot' do
    before { table.instance_variable_set('@robot', robot) }

    context 'left turn' do
      let(:turn)       { :left }
      let(:left_robot) { instance_double(Robot, x: 0, y: 0) }

      before do
        allow(robot).to receive(:left_robot) { left_robot }
        table.place_turned_robot(turn)
      end

      it 'places a turned robot' do
        expect(grid[left_robot.y][left_robot.x]).to eq left_robot
      end
    end

    context 'right turn' do
      let(:turn) { :right }
      let(:right_robot) { instance_double(Robot, x: 0, y: 0) }

      before do
        table.instance_variable_set('@robot', robot)
        allow(robot).to receive(:right_robot) { right_robot }
        table.place_turned_robot(turn)
      end

      it 'places a turned robot' do
        expect(grid[right_robot.y][right_robot.x]).to eq right_robot
      end
    end
  end

  describe '#report_robots_position' do
    before { table.instance_variable_set('@robot', robot) }

    it 'returns the robots string representation' do
      expect(table.report_robots_position).to eq robot.to_s
    end
  end
end
