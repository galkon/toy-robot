class Robot
  attr_reader :position, :direction

  def initialize(position:, direction:)
    @position  = position
    @direction = direction
  end

  def left_robot
    Robot.new(position: position, direction: direction.left_direction)
  end

  def right_robot
    Robot.new(position: position, direction: direction.right_direction)
  end

  def move
    @position = position.transform(direction.transformation)
    self
  end

  def eql?(other)
    position == other.position && direction == other.direction
  end

  def to_s
    "Position: [#{position}], Direction: [#{direction}]"
  end
end
