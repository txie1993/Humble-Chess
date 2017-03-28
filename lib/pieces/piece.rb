class Piece
    attr_reader :board, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        board.add_piece(self, pos)
    end

    def has_moves?
        !moves.empty?
    end

    def to_s
        if @color == :black
            color_tag = 'b'
        elsif @color == :white
            color_tag = 'w'
        end

        "#{color_tag}#{symbol} "
    end

    def empty?
        is_a?(NullPiece) ? true : false
    end

    def symbol; end

    def name; end
end
