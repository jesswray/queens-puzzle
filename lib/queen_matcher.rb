require_relative 'queen'
require_relative 'chessboard'

class QueenMatcher
  def initialize(queens)
    @queens = queens
    fail 'Two queens and two queens only!' if @queens.count != 2
  end

  def attacking?
    shared_diagonal? || shared_vertical? || shared_horizontal?
  end

  private

  def shared_diagonal?
    difference_on_axis(:x) == difference_on_axis(:y)
  end

  def shared_vertical?
    shared_axis?(:y)
  end

  def shared_horizontal?
    shared_axis?(:x)
  end

  def shared_axis?(axis)
    @queens.map(&axis).reduce(&:==)
  end

  def difference_on_axis(axis)
    @queens.map(&axis).reduce(&:-).abs
  end
end
