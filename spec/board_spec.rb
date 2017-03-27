require 'rspec'
require 'board'

describe Board do
    subject(:board) { Board.new }

    describe '#initialize' do
        it 'sets up an 8x8 chessboard' do
            expect(board.rows.length).to eq(8)
            expect(board.rows.first.length).to eq(8)
        end

        it 'makes all blank spaces Null Pieces' do
            expect(board.rows.flatten.uniq).to eq([NullPiece.instance])
        end
    end

    describe '#empty?' do
        it 'finds null pieces' do
            expect(board.empty?([0, 0])).to eq(true)
        end
    end

    describe '#valid_pos?' do
        it 'makes sure things are in bounds' do
            expect(board.valid_pos?([0, 5])).to eq(true)
            expect(board.valid_pos?([9, 1])).to eq(false)
        end
    end

    describe '#enemy?' do
        it 'finds pieces of the opposite color' do
            expect(board.enemy?([2, 2], :white)).to eq(true)
        end
    end

    describe '#valid_command?' do
        it 'ensures the right inputs' do
            expect(board.valid_command?('a2bk')).to eq(true)
            expect(board.valid_command?('c9mk')).to eq(false)
            expect(board.valid_command?('c8bo')).to eq(false)
        end
    end

    describe '#parse' do
        it 'places pieces correctly' do
            board.parse('c3bn')
            pos = [2, 2]
            expect(board[pos].class).to eq(Knight)
        end
    end

    describe '#pos_to_coord' do
        it 'translates array location to chessboard coords' do
            expect(board.pos_to_coord([0, 0])).to eq('a1')
            expect(board.pos_to_coord([7, 7])).to eq('h8')
        end
    end

    describe '#moves_to_coords' do
        it 'translates array of array locations to a sorted array of chessboard coords' do
            expect(board.moves_to_coords([[0, 0], [7, 7]])).to eq(['a1', 'h8'])
        end
    end
end
