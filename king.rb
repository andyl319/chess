require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
  include SteppingPiece

  def initialize(pos, board)
    super
    @diffs = [
      [1, 0],
      [1, 1],
      [0, 1],
      [-1, 1],
      [-1, 0],
      [-1, -1],
      [0, -1],
      [1, -1]
    ]
  end
end
