class Table
  attr_reader :grid, :robot

  def initialize
    @grid = Array.new(height) { Array.new(width) }
  end

  def place_robot(robot)
    if within_bounds?(robot)
      remove_robots
      @robot = robot
      grid[robot.position.y][robot.position.x] = self.robot
    end
    nil
  end

  def report_robots_position
    robot.to_s
  end

  private

  def within_bounds?(object)
    object.position.x >= 0 &&
      object.position.y >= 0 &&
      object.position.x < width &&
      object.position.y < height
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
