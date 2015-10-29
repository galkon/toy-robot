class Robot
  attr_reader :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction
  end

  def left
    position = position.left_position
  end
end