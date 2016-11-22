
module SlidingPiece
  attr_reader :directions

  def moves
    moves = []

    move_directions.each do |direction|

      new_move = [position[0] + direction[0], position[1] + direction[1]]
      until board[new_move].class.superclass == Piece || new_move[0] > 7 ||
        new_move[0] < 0 || new_move[1] > 7 || new_move[1] < 0

        moves << new_move
        new_move = [new_move[0] + direction[0], new_move[1] + direction[1]]
      end
    end

    moves
  end

  private

  def move_directions
    directions
  end
end
