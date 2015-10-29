class Robot
  attr_accessor :x, :y, :facing

  def initialize(x, y, facing)
    @facing = facing
    @x      = x
    @y      = y
  end
end