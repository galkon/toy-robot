class RobotController
  attr_reader :table

  def initialize(table)
    @table = table
  end

  def place(x:, y:, facing:)
    table.place_robot(build_robot(position(x, y), direction(facing)))
  end

  def report
    @table.report_robots_position
  end

  def move
    @table.move_robot
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
