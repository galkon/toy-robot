class Direction
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def left_direction
    direction_turning(-1)
  end

  def right_direction
    direction_turning(1)
  end

  def eql?(object)
    self.value == object.value
  end

  def to_s
    "value = #{value}"
  end

  private

  def direction_turning(turn)
    Direction.new(compass_for_direction.rotate(turn).first).freeze
  end

  def compass_for_direction
    compass.rotate(compass.index(value))
  end

  def compass
    [:west, :north, :east, :south].freeze
  end
end