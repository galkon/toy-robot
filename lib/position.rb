class Position
  attr_reader :x, :y

  def initialize(x:,y:)
    @x = x
    @y = y
  end

  def transform(x:, y:)
    Position.new(x: self.x + x, y: self.y + y)
  end

  def eql?(obj)
    self.x == obj.x && self.y == obj.y
  end

  def to_s
    "x = #{x}, y = #{y}"
  end
end