require_relative 'ip_checker'
require_relative 'chessboard'
require_relative 'queen_matcher'
require 'pry'

class App
  def initialize(ip = nil)
    @ip = ip
  end

  def run
    # Fetch the board size and cast it to an integer.
    board_size = IpChecker.new(@ip).latitude.to_int
    # Create the board and assign its pieces.
    chessboard = Chessboard.new(board_size)
    chessboard.assign_pieces!
    matches = chessboard.attacking_coordinates
    matches.any? ? matches : 'true'
  end
end
