require_relative 'queen'
require_relative 'queen_matcher'

class Chessboard
  attr_reader :size, :pieces

  def initialize(size)
    @size = size
  end

  def assign_pieces!
    @pieces = Array.new(number_of_pieces).map do
      piece = assign_until_unique(Queen.new)
      coordinates << piece.coordinates
      piece
    end
  end

  def attacking_coordinates
    attacking_pairs.map { |pair| pair.map(&:coordinates) }
  end

  private

  # All possible pairs of pieces
  def pairs
    @pieces.combination(2).to_a
  end

  def assign_until_unique(piece)
    x = random_in_range
    y = random_in_range
    unless coordinates.include? [x, y]
      piece.coordinates = [x, y]
      return piece
    end

    assign_until_unique(piece)
  end

  def attacking_pairs
    pairs.select { |pair| QueenMatcher.new(pair).attacking? }
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

  def coordinates
    @coordinates ||= []
  end
end
