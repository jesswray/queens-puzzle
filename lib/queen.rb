class Queen
  attr_accessor :x, :y

  def assign_coordinates(x, y)
    self.x = x
    self.y = y
  end

  def coordinates
    [x, y]
  end
end
