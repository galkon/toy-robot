class Robot
  def initialize(x:, y:, facing:)
    @position  = Position.new(x: x, y: y).freeze
    @direction = Direction.new(facing).freeze
  end

  def left_robot
    turned_robot(:left)
  end

  def right_robot
    turned_robot(:right)
  end

  def moved_robot
    build_robot_with(position: moved_position, direction: direction)
  end

  def x
    position.x
  end

  def y
    position.y
  end

  def to_s
    "Robot: [x = #{x}, y = #{y}, facing = #{facing}]"
  end

  def ==(other)
    self.class == other.class &&
      position == other.position &&
      direction == other.direction
  end

  private

  def facing
    direction.value
  end

  def build_robot_with(position:, direction:)
    Robot.new(x: position.x, y: position.y, facing: direction.value).freeze
  end

  def moved_position
    position.transform(direction.transformation)
  end

  def turned_robot(turn)
    build_robot_with(position: position, direction: direction_for(turn))
  end

  def direction_for(turn)
    direction.send(:"#{turn}_direction")
  end

  protected

  attr_reader :position, :direction
end
