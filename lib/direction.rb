require 'transformation'

class Direction
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def left_direction
    direction_for(left)
  end

  def right_direction
    direction_for(right)
  end

  def eql?(other)
    value == other.value
  end

  def transformation
    transformations[value].freeze
  end

  def to_s
    "value = #{value}"
  end

  private

  def left
    -1
  end

  def right
    1
  end

  def direction_for(turn)
    Direction.new(compass_for_direction.rotate(turn).first).freeze
  end

  def compass_for_direction
    compass.rotate(compass.index(value))
  end

  def compass
    [:west, :north, :east, :south].freeze
  end

  def transformations
    {
      west:  Transformation.new(x: -1, y:  0),
      north: Transformation.new(x:  0, y:  1),
      east:  Transformation.new(x:  1, y:  0),
      south: Transformation.new(x:  0, y: -1)
    }
  end
end
