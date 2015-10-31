class Simulation
  def initialize(table)
    @table = table
  end

  def place(x:, y:, facing:)
    table.place_robot(Robot.new(x: x, y: y, facing: facing))
  end

  def report
    table.report_robots_position
  end

  def move
    table.move_robot
  end

  private

  attr_reader :table
end
