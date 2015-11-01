class Table
  def initialize(width = 5, height = 5)
    @width = width
    @height = height
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

  def place_moved_robot
    place_robot(robot.moved_robot)
  end

  def place_turned_robot(turn)
    place_robot(robot.send(:"#{turn}_robot")) if [:left, :right].include?(turn)
  end

  def report_robots_position
    robot.to_s
  end

  private

  attr_reader :grid, :robot, :width, :height

  def within_bounds?(object)
    object.x >= 0 && object.y >= 0 && object.x < width && object.y < height
  end

  def remove_robots
    grid.each { |row| row.delete_if { |item| item.is_a?(Robot) } }
  end
end
