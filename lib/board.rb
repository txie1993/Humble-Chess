class Board
  attr_reader :rows
    def initialize
        @rows = Array.new(8) { Array.new(8) }
    end

    def [](pos)
        raise 'invalid pos' unless valid_pos?(pos)

        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        raise 'invalid pos' unless valid_pos?(pos)

        row, col = pos
        @rows[row][col] = piece
    end

    def empty?(pos)
        self[pos].empty?
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end
end
