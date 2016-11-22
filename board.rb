require_relative 'piece'
require_relative 'bishop'
require_relative 'knight'
require_relative 'king'
require_relative 'rook'
require_relative 'queen'
require_relative 'pawn'

class Board
  attr_accessor :grid

  PIECES = {
    r: lambda { |pos, board| Rook.new(pos, board) },
    n: lambda { |pos, board| Knight.new(pos, board) },
    b: lambda { |pos, board| Bishop.new(pos, board) },
    q: lambda { |pos, board| Queen.new(pos, board) },
    k: lambda { |pos, board| King.new(pos, board) },
    p: lambda { |pos, board| Pawn.new(pos, board) },
    e: lambda { |_, _| nil }
  }.freeze

  def initialize(grid)
    @grid = set_grid(grid)
    assign_colors
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at start position." unless self[start_pos].class == Piece
    unless end_pos[0] <= 7 && end_pos[0] >= 0 &&
      end_pos[1] <= 7 && end_pos[1] >= 0
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

  def set_grid(grid)

    grid.map.with_index do |row, i|
      row.split("").map.with_index do |space, j|
        PIECES[space.to_sym].call([i, j], self)
      end
    end
  end

  def assign_colors
    grid.each_with_index do |row, i|
      row.each do |el|
        if i < 2
          el.color = "black"
        elsif i > 5
          el.color = "white"
        end
      end
    end
  end
end
