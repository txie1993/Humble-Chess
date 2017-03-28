require_relative 'piece'

class Pawn < Piece
    def symbol
        'P'
    end

    def name
        'Pawn'
    end

    def moves
        forward_steps + diag_moves
    end

    private

    def at_start_row?
        pos[0] == (color == :white ? 6 : 1)
    end

    def move_dir
        color == :white ? -1 : 1
    end

    def forward_steps
        steps = []
        i, j = pos
        one_step = [i + move_dir, j]
        return steps unless board.movable?(one_step)

        steps << one_step

        two_step = [i + 2 * move_dir, j]
        steps << two_step if at_start_row? && board.empty?(two_step)
        steps
    end

    def diag_moves
        row, col = pos
        new_row = row + move_dir
        moves = []

        [1, -1].each do |diag|
            pos = [new_row, col + diag]
            next unless board.valid_pos?(pos)
            next if board[pos].empty?
            moves << pos if board.enemy?(pos, color)
        end

        moves
    end
end
