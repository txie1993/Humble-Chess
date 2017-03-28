module Step
    def moves
        moves = []
        move_diffs.each do |diff|
            diff_x, diff_y = diff
            pos_x, pos_y = pos
            pos = [pos_x + diff_x, pos_y + diff_y]

            next unless board.valid_pos?(pos)

            moves << pos if board.empty?(pos) || board.enemy?(pos, color)
        end
        moves
    end

    private

    def move_diffs; end
end
