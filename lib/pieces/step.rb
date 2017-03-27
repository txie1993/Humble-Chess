module Step
    def moves
        moves = []
        move_diffs.each do |diff|
            i, j = diff
            cur_x, cur_y = pos
            pos = [cur_x + i, cur_y + j]

            next unless board.valid_pos?(pos)

            moves << pos if board.empty?(pos) || board.enemy?(pos, color)
        end
        moves
    end

    private

    def move_diffs; end
end
