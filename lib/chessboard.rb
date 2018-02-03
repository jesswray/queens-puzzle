require_relative 'queen'

class Chessboard
  attr_reader :size, :pieces

  def initialize(size)
    @size = size
  end

  def coordinates
    @coordinates ||= []
  end

  def assign_pieces!
    # Assign two random coordinates between 1 and n
    @pieces = Array.new(number_of_pieces)

    @pieces = @pieces.map do |_piece|
      piece = assign_until_unique
      coordinates << piece.coordinates
      piece
    end
  end

  def assign_until_unique(piece = Queen.new)
    x = random_in_range
    y = random_in_range
    unless coordinates.include? [x, y]
      piece.coordinates = [x, y]
      return piece
    end

    assign_until_unique(piece)
  end

  # All possible pairs of pieces
  def pairs
    @pieces.combination(2).to_a
  end

  def attacking_pairs
    pairs.select do |pair|
      QueenMatcher.new(pair).attacking?
    end
  end

  def attacking_coordinates
    attacking_pairs.map do |pair|
      pair.map(&:coordinates)
    end
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
