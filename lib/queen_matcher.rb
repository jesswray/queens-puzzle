require_relative 'queen'
require_relative 'chessboard'

class QueenMatcher
  def initialize(queens)
    @queens = queens
    fail 'Two queens and two queens only, silly!' if @queens.count != 2
  end

  def attacking?
    shared_diagonal? || shared_vertical? || shared_horizontal?
  end

  private

  def shared_diagonal?
    x_difference = difference_on_axis(:x)
    y_difference = difference_on_axis(:y)

    x_difference == y_difference
  end

  def shared_vertical?
    @queens.map(&:y).reduce(&:==)
  end

  def shared_horizontal?
    @queens.map(&:x).reduce(&:==)
  end

  def difference_on_axis(axis)
    @queens.map(&axis).reduce(&:-).abs
  end
end
