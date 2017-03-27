module Slide
    def horizontal_dirs
        [[-1, 0],
         [0, -1],
         [0, 1],
         [1, 0]]
    end

    def diagonal_dirs
        [[-1, -1],
         [-1, 1],
         [1, -1],
         [1, 1]]
    end

    def moves
        moves = []
        move_dirs.each { |i, j| moves.concat(move_around(i, j)) }
        moves
    end

    private

    def move_dirs; end

    def move_around(i, j)
        cur_x, cur_y = pos
        moves = []
        loop do
            cur_x += i
            cur_y += j
            pos = [cur_x, cur_y]

            break unless board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos
            else
                moves << pos if board.enemy?(pos, color)
                break
            end
        end
        moves
    end
end
