require 'spec_helper'
require 'table'
require 'robot'
require 'position'
require 'direction'
require 'robot_controller'

describe RobotController do
  let(:table)            { Table.new }
  let(:robot_controller) { RobotController.new(table) }
  let(:position)         { Position.new(x: 0, y: 0) }
  let(:direction)        { Direction.new(:east) }
  let(:robot)            { Robot.new(position: position, direction: direction) }

  context 'attributes' do
    it 'has a table' do
      expect(robot_controller.table).to eq table
    end
  end

  describe '#place' do
    before do
      allow(table).to receive(:place_robot)
      robot_controller.place(x: 0, y: 0, facing: :east)
    end

    it 'creates a robot and adds it to the controller' do
      expect(robot_controller.robot).to eq robot
    end

    it 'places the robot on the table' do
      expect(table).to have_received(:place_robot).with(robot)
    end
  end

  describe '#report' do
    before { robot_controller.place(x: 0, y: 0, facing: :east) }

    it 'returns the strong representation of the robot' do
      expect(robot_controller.report).to eq robot.to_s
    end
  end
end
