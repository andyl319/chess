require_relative 'sliding_piece'
require_relative 'piece'


class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board)
    super
    @directions = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
  end
end
