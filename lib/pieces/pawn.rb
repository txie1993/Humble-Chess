require_relative 'piece'

class Pawn < Piece
    def symbol
        'P'
    end

    def name
        'Pawn'
    end

    def moves
        forward_steps + side_attacks
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

    def side_attacks
        i, j = pos

        side_moves = [[i + move_dir, j - 1], [i + move_dir, j + 1]]

        side_moves.select do |new_pos|
            next false unless board.valid_pos?(new_pos)
            next false if board.empty?(new_pos)

            threatened_piece = board[new_pos]
            threatened_piece && threatened_piece.color != color
        end
    end
end
