require_relative 'board'
class Game
  attr_reader :board
  def initialize(board = Board.new)
    @board = board
  end

  def show_board
    letters = ('a'..'h').to_a
    p (1..8).to_a
    @board.rows.each_with_index do |row, idx|
      p letters[idx]
      p row.join((' '))
    end
  end
end

g = Game.new
g.show_board
