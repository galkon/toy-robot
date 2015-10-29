class Direction
  attr_reader :value

  COMPASS = [:west, :north, :east, :south].freeze
  LEFT    = -1
  RIGHT   = 1

  def initialize(value)
    @value = value
  end

  def left_direction
    direction_for(LEFT)
  end

  def right_direction
    direction_for(RIGHT)
  end

  def eql?(object)
    self.value == object.value
  end

  def to_s
    "value = #{value}"
  end

  private

  def direction_for(turn)
    Direction.new(compass_for_direction.rotate(turn).first).freeze
  end

  def compass_for_direction
    COMPASS.rotate(COMPASS.index(value))
  end
end