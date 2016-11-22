require_relative 'piece'

class Pawn < Piece
  def initialize(pos, board)
    super
    @at_start = true
    @forward_dir = find_forward_dir
  end

  def moves
    if at_start_now?
      [@forward_dir, [@forward_dir[0]*2, 0]]
    else
      @forward_dir

    end
  end

  def find_forward_dir
    return [1, 0] if position[0] == 1
    [-1, 0]
  end

  def at_start_now?
    @at_start
  end
end
