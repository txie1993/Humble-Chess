require_relative 'pieces'
class Board
    LETTERS = ('a'..'h').to_a
    attr_reader :rows
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) { Array.new(8) { @null_piece } }
    end

    def [](pos)
        row, col = pos
        @rows[row][col] if valid_pos?(pos)
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece if valid_pos?(pos)
    end

    def empty?(pos)
        self[pos].empty?
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end

    def movable?(pos)
        empty?(pos) && valid_pos?(pos)
    end

    def add_piece(piece, pos)
        self[pos] = piece if empty?(pos)
    end

    def parse(command)
        if valid_command?(command)
            row = LETTERS.index(command[0])
            col = command[1].to_i - 1
            pos = [row, col]
            color = command[2] == 'w' ? :white : :black
            piece_type = letter_to_piece(command[3])

            piece_type.new(color, self, pos)
        else
            puts 'Invalid command, try again.'
        end
    end

    def valid_command?(command)
        return false unless LETTERS.include?(command[0])
        return false unless command[1].to_i.between?(1, 8)
        return false unless %w(b w).include?(command[2])
        return false unless %w(k q b n r p).include?(command[3])
        true
    end

    def enemy?(pos, color)
        return false unless valid_pos?(pos)
        self[pos].color != color
    end

    def set_default_board
        [0, 1, 6, 7].each do |row|
            (0..7).each do |col|
                pos = [row, col]
                color = row < 2 ? :black : :white
                piece_type = row.between?(1, 6) ? Pawn : position_to_piece(col)
                piece_type.new(color, self, pos)
            end
        end
    end

    def position_to_piece(num)
        case num
        when 0, 7
            Rook
        when 1, 6
            Knight
        when 2, 5
            Bishop
        when 3
            King
        when 4
            Queen
        end
    end

    def letter_to_piece(c)
        case c
        when 'k'
            King
        when 'q'
            Queen
        when 'b'
            Bishop
        when 'n'
            Knight
        when 'r'
            Rook
        when 'p'
            Pawn
        end
    end

    def pos_to_coord(pos)
        i, j = pos
        "#{LETTERS[i]}#{j + 1}"
    end

    def moves_to_coords(moves)
        coords = moves.map { |move| pos_to_coord(move) }
        coords.sort
    end

    def print_moves(color)
        @rows.each do |row|
            row.each do |piece|
                next if piece.empty?
                if piece.color == color && piece.has_moves?
                    puts "The #{piece.color} #{piece.name} at #{pos_to_coord(piece.pos)} can move to the following:"
                    p moves_to_coords(piece.moves)
                end
            end
        end
    end
end
