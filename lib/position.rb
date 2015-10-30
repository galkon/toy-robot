require 'transformation'

class Position
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def transform(transformation)
    Position.new(x: x + transformation.x, y: y + transformation.y).freeze
  end

  def eql?(other)
    x == other.x && y == other.y
  end

  def to_s
    "x = #{x}, y = #{y}"
  end
end
