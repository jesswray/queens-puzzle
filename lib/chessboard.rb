require 'queen'

class Chessboard
  attr_reader :size, :pieces, :coordinates

  def initialize(size)
    @size = size
  end

  def assign_pieces
    @coordinates = []
    # Assign two random coordinates between 1 and n
    @pieces = Array.new(number_of_pieces, Queen.new).map do |piece|
      assign_until_unique(piece)
      @coordinates << piece.coordinates
      piece
    end
  end

  def assign_until_unique(piece)
    x = random_in_range
    y = random_in_range

    unless @coordinates.include? [x, y]
      piece.assign_coordinates(x, y)
      return piece
    end

    assign_until_unique(piece)
  end

  def range
    1..@size
  end

  def random_in_range
    Random.new.rand(range)
  end

  def number_of_pieces
    (@size / 2).floor
  end
end
