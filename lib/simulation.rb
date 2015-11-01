class Simulation
  def initialize(table = Table.new)
    @table = table
  end

  def place(x:, y:, facing:)
    table.place_robot(Robot.new(x: x, y: y, facing: facing))
  end

  def report
    puts table.report_robots_position
  end

  def move
    table.place_moved_robot
  end

  def left
    table.place_turned_robot(:left)
  end

  def right
    table.place_turned_robot(:right)
  end

  private

  attr_reader :table
end
