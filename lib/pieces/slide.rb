module Slide
    def horizontal_dirs
        [
            [-1, 0],
            [0, -1],
            [0, 1],
            [1, 0]
        ]
    end

    def diagonal_dirs
        [
            [-1, -1],
            [-1, 1],
            [1, -1],
            [1, 1]
        ]
    end

    def moves
        moves = []

        move_dirs.each do |dx, dy|
            moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end

        moves
    end

    private

    def move_dirs; end

    def grow_unblocked_moves_in_dir(dx, dy)
        cur_x, cur_y = pos
        moves = []
        loop do
            cur_x += dx
            cur_y += dy
            pos = [cur_x, cur_y]

            break unless board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos
            else
                # can take an opponent's piece
                moves << pos if board[pos].color != color

                # can't move past blocking piece
                break
            end
        end
        moves
    end
end
