module SteppingPiece
  attr_reader :diffs

  def moves
    moves = move_diffs.map do |diff|
      [position[0] + diff[0], position[1] + diff[1]]
    end

    moves.select do |move|
      move[0] <= 7 && move[0] >= 0 && move[1] <= 7 && move[1] >= 0
    end
  end

  private

  def move_diffs
    diffs
  end
end
