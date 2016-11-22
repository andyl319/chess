require_relative 'board'
require_relative 'display'

class Game
  attr_reader :display
  def initialize(display)
    @display = display
  end

  def play
    until display.cursor.board.over?
      system 'clear'
      display.render
      display.cursor.get_input
    end
  end
end


board = ["rnbqkbnr",
         "pppppppp",
         "eeeeeeee",
         "eeeeeeee",
         "eeeeeeee",
         "eeeeeeee",
         "pppppppp",
         "rnbqkbnr"]

test_board = ["rnbqkbnr",
              "eppepppp",
              "peeeeeee",
              "eeeeeeee",
              "eeeeeeee",
              "eeeeeeee",
              "pppppppp",
              "rnbqkbnr"]

# this_board = Board.new(board)
# this_board.move_piece([0, 0], [4, 4])
#
# display = Display.new(this_board)

test_b = Board.new(test_board)
display = Display.new(test_b)
# p display
game = Game.new(display)

p game.display.cursor.board[[6, 0]].moves
p game.display.cursor.board[[1, 1]].moves
# p game.display.cursor.board[[0, 3]].moves
# game.play
