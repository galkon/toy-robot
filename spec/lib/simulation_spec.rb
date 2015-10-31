require 'spec_helper'

describe Simulation do
  let(:table)            { instance_double(Table) }
  let(:robot_controller) { Simulation.new(table) }
  let(:robot)            { Robot.new(x: 0, y: 0, facing: :east) }

  describe '#place' do
    before do
      allow(table).to receive(:place_robot)
      robot_controller.place(x: 0, y: 0, facing: :east)
    end

    it 'places the robot on the table' do
      expect(table).to have_received(:place_robot).with(robot)
    end
  end

  describe '#report' do
    let(:position) { 'position' }

    before do
      allow(table).to receive(:report_robots_position) { position }
    end

    it 'returns the string representation of the robot' do
      expect(robot_controller.report).to eq position
    end
  end

  describe '#move' do
    before { allow(table).to receive(:place_moved_robot) }

    it 'instructs the table to move the robot' do
      robot_controller.move
      expect(table).to have_received(:place_moved_robot)
    end
  end

  describe '#left' do
    before { allow(table).to receive(:place_turned_robot) }

    it 'instructs the table to turn the robot left' do
      robot_controller.left
      expect(table).to have_received(:place_turned_robot).with(:left)
    end
  end

  describe '#right' do
    before { allow(table).to receive(:place_turned_robot) }

    it 'instructs the table to turn the robot right' do
      robot_controller.right
      expect(table).to have_received(:place_turned_robot).with(:right)
    end
  end
end
