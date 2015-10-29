class Robot
  attr_reader :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction
  end

  def left
    @direction = direction.left_direction
  end

  def right
    @direction = direction.right_direction
  end
end