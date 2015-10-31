class Table
  def initialize
    @grid = Array.new(height) { Array.new(width) }
  end

  def place_robot(robot)
    if within_bounds?(robot)
      remove_robots
      @robot = robot
      grid[robot.y][robot.x] = @robot
    end
    nil
  end

  def move_robot
    place_robot(robot.moved_robot)
  end

  def report_robots_position
    robot.to_s
  end

  private

  attr_reader :grid, :robot

  def within_bounds?(object)
    object.x >= 0 &&
      object.y >= 0 &&
      object.x < width &&
      object.y < height
  end

  def width
    5
  end

  def height
    5
  end

  def remove_robots
    grid.each { |row| row.delete_if { |item| item.is_a?(Robot) } }
  end
end
