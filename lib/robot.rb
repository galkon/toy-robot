class Robot
  attr_reader :position, :direction

  def initialize(position:, direction:)
    @position  = position
    @direction = direction
  end

  def left_robot
    turned_robot(:left)
  end

  def right_robot
    turned_robot(:right)
  end

  def moved_robot
    Robot.new(position: moved_position, direction: direction)
  end

  def ==(other)
    self.class == other.class &&
      position == other.position &&
      direction == other.direction
  end

  def x
    position.x
  end

  def y
    position.y
  end

  def to_s
    "Position: [#{position}], Direction: [#{direction}]"
  end

  private

  def moved_position
    position.transform(direction.transformation)
  end

  def turned_robot(turn)
    Robot.new(position: position, direction: direction_for(turn))
  end

  def direction_for(turn)
    direction.send(:"#{turn}_direction")
  end
end
