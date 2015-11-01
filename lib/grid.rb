class Grid
  attr_reader :robot, :width, :height

  def initialize(robot, width = 5, height = 5)
    @robot  = robot
    @width  = width
    @height = height
    @grid   = build_grid
  end

  private

  attr_reader :grid

  def build_grid
    grid = Array.new(height) { Array.new(width) }
    grid[robot.y][robot.x] = robot
    grid
  end
end
