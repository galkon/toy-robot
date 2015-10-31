require 'spec_helper'

describe Simulation do
  let(:table)      { instance_double(Table) }
  let(:simulation) { Simulation.new(table) }
  let(:robot)      { Robot.new(x: 0, y: 0, facing: :east) }

  describe 'default attributes' do
    it 'can be initialized with no attributes' do
      expect { Simulation.new }.to_not raise_error(ArgumentError)
    end
  end

  describe '#place' do
    before do
      allow(table).to receive(:place_robot)
      simulation.place(x: 0, y: 0, facing: :east)
    end

    it 'places the robot on the table' do
      expect(table).to have_received(:place_robot).with(robot)
    end
  end

  describe '#report' do
    let(:position) { 'position' }

    before do
      allow(simulation).to receive(:puts)
      allow(table).to receive(:report_robots_position) { position }
    end

    it 'returns the string representation of the robot' do
      simulation.report
      expect(simulation).to have_received(:puts).with(position)
    end
  end

  describe '#move' do
    before { allow(table).to receive(:place_moved_robot) }

    it 'instructs the table to move the robot' do
      simulation.move
      expect(table).to have_received(:place_moved_robot)
    end
  end

  describe '#left' do
    before { allow(table).to receive(:place_turned_robot) }

    it 'instructs the table to turn the robot left' do
      simulation.left
      expect(table).to have_received(:place_turned_robot).with(:left)
    end
  end

  describe '#right' do
    before { allow(table).to receive(:place_turned_robot) }

    it 'instructs the table to turn the robot right' do
      simulation.right
      expect(table).to have_received(:place_turned_robot).with(:right)
    end
  end
end
