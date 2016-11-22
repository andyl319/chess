class Piece
  attr_reader :position, :board
  attr_accessor :color
  def initialize(pos, board)
    @position = pos
    @board = board
    @color = nil
  end
end
