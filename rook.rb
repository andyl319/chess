require_relative 'sliding_piece'
require_relative 'piece'


class Rook < Piece
  include SlidingPiece

  def initialize(pos, board)
    super
    @directions = [[1, 0], [-1, 0], [0, -1], [0, 1]]
  end
end
