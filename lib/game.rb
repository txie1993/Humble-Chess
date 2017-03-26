require_relative 'board'
class Game
  attr_reader :board
  def initialize(board = Board.new)
    @board = board
  end

  def show_board
    letters = ('A'..'H').to_a
    row_string = ""
    puts (0..8).to_a.join('  ')
    @board.rows.each_with_index do |row, idx|
      row_string += "#{letters[idx]} "
      row.each do |space|
        row_string += space.to_s
      end
      puts row_string
      row_string = ""
    end
  end
end

g = Game.new
b = Bishop.new(:black, g.board, [0, 0])
r = Rook.new(:white, g.board, [0, 1])
g.show_board
