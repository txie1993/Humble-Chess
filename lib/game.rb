require_relative 'board'
class Game
    attr_reader :board
    def initialize(board = Board.new)
        @board = board
    end

    def play
        set_board
        color = get_current_color
        @board.print_moves(color)
    end

    def show_board
        letters = ('A'..'H').to_a
        row_string = ''

        puts (0..8).to_a.join('  ')

        @board.rows.each_with_index do |row, idx|
            row_string += "#{letters[idx]} "

            row.each do |space|
                row_string += space.to_s
            end

            puts row_string
            row_string = ''
        end
    end

    def set_board
        puts 'Enter a valid 4-character string (i.e. "c3bn" will place a black knight at C3). Type "stop" to finish setting up. Letters must be lowercase. Note that black starts at the top of the board and white at the bottom.'
        loop do
            show_board
            command = get_command
            break if command == 'stop'
        end
    end

    def get_command
        puts 'Enter a valid 4-character string:'
        command = gets.chomp
        return command if command == 'stop'
        @board.parse(command)
    end

    def get_current_color
      puts "Which color's turn is it currently? (w/b) Letters must be lowercase."
        loop do
            current_turn = gets.chomp
            if current_turn == 'w'
                return :white
            elsif current_turn == 'b'
                return :black
            else
                puts "That's not a color. Enter only w or b."
            end
        end
    end
end
#
# g = Game.new
# g.play
