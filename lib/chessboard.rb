class Chessboard
  Queen = Struct.new(:x, :y)

  def initialize(number)
    @number = number
  end

  def assign_pieces
    pieces_to_assign = (@number/2).floor

    range = 1..@number
    pnrg = Random.new
    # for each piece
    # Assign one random coordinate between 1 and n
    x_coords = Array.new(pieces_to_assign).map do
      pnrg.rand(range)
    end


    # If any are dupes, pick again -- come back to this
  end
end
