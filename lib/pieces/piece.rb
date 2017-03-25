class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(color, board, pos)
    raise 'invalid color' unless [:white, :black].include?(color)

    @color, @board, @pos = color, board, pos

    board.add_piece(self, pos)
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    self.is_a?(NullPiece) ? true : false
  end

  def symbol; end

end
