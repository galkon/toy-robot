class Table
  attr_reader :grid

  def initialize
    @grid = Array.new(5) { Array.new(5) }
  end

  def place_robot(robot)
    if robot.position.y < grid.size
      remove_robots
      grid[robot.position.y][robot.position.x] = robot
    end
    self
  end

  private

  def remove_robots
    grid.each { |row| row.delete_if { |item| item.is_a?(Robot) } }
  end
end
