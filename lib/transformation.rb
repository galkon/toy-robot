class Transformation
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def eql?(obj)
    x == obj.x && y == obj.y
  end
end