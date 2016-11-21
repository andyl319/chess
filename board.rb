class Board
  attr_accessor :grid

  PIECES = {
    r: lambda { Piece.new },
    n: lambda { Piece.new },
    b: lambda { Piece.new },
    q: lambda { Piece.new },
    k: lambda { Piece.new },
    p: lambda { Piece.new },
    e: lambda { nil }
  }

  def initialize(board)
    @grid = set_grid(board)
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at start position." unless self[start_pos].class == Piece
    unless end_pos[0] <= 7 && end_pos[0] >= 0 && end_pos[1] <= 7 && end_pos[1] >= 0
      raise "Move is outside of board."
    end

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def over?
    false
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  private

  def set_grid(board)

    board.map do |row|
      row.split("").map do |space|
        PIECES[space.to_sym].call
      end
    end
  end
end

class Piece

end
