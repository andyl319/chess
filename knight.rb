require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece
  
  def initialize(pos, board)
    @diffs = [
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1],
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2]
    ]

    super
  end
end
