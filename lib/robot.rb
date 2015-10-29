class Robot
  attr_reader :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction
  end

  def left
    @direction = direction.left_direction
    self
  end

  def right
    @direction = direction.right_direction
    self
  end

  def to_s
    "Position: [#{position.to_s}], Direction: [#{direction.to_s}]"
  end
end