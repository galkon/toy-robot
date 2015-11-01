require 'spec_helper'

describe Table do
  let(:table) { Table.new }
  let(:robot) { instance_double(Robot, x: 0, y: 0) }
  let(:grid)  { instance_double(Grid, robot: robot, width: 5, height: 5) }

  before { table.instance_variable_set('@grid', grid) }

  describe '#place_robot' do
    before do
      allow(Grid).to receive(:new)
      table.place_robot(robot)
    end

    it 'creates a new grid with the robot' do
      expect(Grid).to have_received(:new).with(robot)
    end

    it 'returns nil' do
      expect(table.place_robot(robot)).to eq nil
    end

    context 'robot x is negative' do
      let(:robot) { instance_double(Robot, x: -2, y: 0) }

      it "doesn't set a grid with the robot" do
        table.place_robot(robot)
        expect(Grid).to_not have_received(:new).with(robot)
      end
    end

    context 'robot y is negative' do
      let(:robot) { instance_double(Robot, x: 0, y: -2) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(Grid).to_not have_received(:new).with(robot)
      end
    end

    context 'robot x is greater than 5' do
      let(:robot) { instance_double(Robot, x: 8, y: 0) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(Grid).to_not have_received(:new).with(robot)
      end
    end

    context 'robot y is greater than 5' do
      let(:robot) { instance_double(Robot, x: 0, y: 8) }

      it "doesn't add the robot to the grid" do
        table.place_robot(robot)
        expect(Grid).to_not have_received(:new).with(robot)
      end
    end
  end

  describe '#place_moved_robot' do
    let(:expected_robot) do
      instance_double(Robot, x: 2, y: 3)
    end

    before do
      allow(table).to receive(:place_robot)
      allow(robot).to receive(:moved_robot) { expected_robot }
    end

    it 'places the moved robot' do
      table.place_moved_robot
      expect(table).to have_received(:place_robot).with(expected_robot)
    end

    context 'no grid' do
      before { table.instance_variable_set('@grid', nil) }

      it "doesn't place the moved robot" do
        table.place_moved_robot
        expect(table).to_not have_received(:place_robot).with(expected_robot)
      end
    end
  end

  describe '#place_turned_robot' do
    before { table.instance_variable_set('@grid', grid) }

    context 'left turn' do
      let(:turn)       { :left }
      let(:left_robot) { instance_double(Robot, x: 0, y: 0) }

      before do
        allow(table).to receive(:place_robot)
        allow(robot).to receive(:left_robot) { left_robot }
      end

      it 'places a turned robot' do
        table.place_turned_robot(turn)
        expect(table).to have_received(:place_robot).with(left_robot)
      end

      context 'no grid' do
        before { table.instance_variable_set('@grid', nil) }

        it "doesn't place the moved robot" do
          table.place_turned_robot(turn)
          expect(table).to_not have_received(:place_robot).with(left_robot)
        end
      end
    end

    context 'right turn' do
      let(:turn) { :right }
      let(:right_robot) { instance_double(Robot, x: 0, y: 0) }

      before do
        allow(table).to receive(:place_robot)
        allow(robot).to receive(:right_robot) { right_robot }
      end

      it 'places a turned robot' do
        table.place_turned_robot(turn)
        expect(table).to have_received(:place_robot).with(right_robot)
      end

      context 'no grid' do
        before { table.instance_variable_set('@grid', nil) }

        it "doesn't place the moved robot" do
          table.place_turned_robot(turn)
          expect(table).to_not have_received(:place_robot).with(right_robot)
        end
      end
    end
  end

  describe '#report_robots_position' do
    before { table.instance_variable_set('@grid', grid) }

    it 'returns the robots string representation' do
      expect(table.report_robots_position).to eq robot.to_s
    end

    context 'no grid' do
      before { table.instance_variable_set('@grid', nil) }

      it 'returns nil' do
        expect(table.report_robots_position).to eq nil
      end
    end
  end
end
