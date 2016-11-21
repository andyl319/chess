require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([1, 0], board)
  end

  def render
    cursor.board.grid.each_with_index do |row, row_i|
      row.each_with_index do |el, col_i|
        if el.class == Piece
          if [row_i, col_i] == cursor.cursor_pos
            print "p".colorize(:background => :red)
          else
            print "p"
          end
        else
          if [row_i, col_i] == cursor.cursor_pos
            print " ".colorize(:background => :red)
          else
            print " "
          end
        end
      end
      print "\n"
    end
  end
end
