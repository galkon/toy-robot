class RobotController
  attr_reader :table, :robot

  def initialize(table)
    @table = table
  end

  def place(x:, y:, facing:)
    @robot = build_robot(position(x,y), direction(facing))
    table.place_robot(robot)
  end

  private

  def build_robot(position, direction)
    Robot.new(position: position, direction: direction)
  end

  def position(x, y)
    Position.new(x: x, y: y)
  end

  def direction(facing)
    Direction.new(facing)
  end
end