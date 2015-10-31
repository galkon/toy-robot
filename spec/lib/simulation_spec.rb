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
    before { allow(table).to receive(:move_robot) }

    it 'calls move_robot on the table' do
      robot_controller.move
      expect(table).to have_received(:move_robot)
    end
  end
end
