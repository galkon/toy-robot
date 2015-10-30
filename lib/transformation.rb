class Transformation
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def eql?(obj)
    self.x == obj.x && self.y == obj.y
  end
end