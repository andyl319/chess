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

this_board = Board.new(board)
this_board.move_piece([0, 0], [4, 4])

display = Display.new(this_board)


game = Game.new(display)
game.play
