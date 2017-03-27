module Step
  def moves
    move_diffs.each_with_object([]) do |diff, moves|
      dx, dy = diff
      cur_x, cur_y = pos
      pos = [cur_x + dx, cur_y + dy]

      next unless board.valid_pos?(pos)

      if board.empty?(pos) || board[pos].color != color
        moves << pos
      end
    end
  end

  private

  def move_diffs; end
end
