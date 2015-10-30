require 'transformation'

class Position
  attr_reader :x, :y

  def initialize(x:,y:)
    @x = x
    @y = y
  end

  def transform(transformation)
    Position.new(x: self.x + transformation.x, y: self.y + transformation.y).freeze
  end

  def eql?(obj)
    self.x == obj.x && self.y == obj.y
  end

  def to_s
    "x = #{x}, y = #{y}"
  end
end