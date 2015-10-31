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

  def moved_robot
    Robot.new(position: moved_position, direction: direction)
  end

  def eql?(other)
    position.eql?(other.position) && direction.eql?(other.direction)
  end

  def to_s
    "Position: [#{position}], Direction: [#{direction}]"
  end

  private

  def moved_position
    position.transform(direction.transformation)
  end
end
