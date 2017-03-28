require 'rspec'
require 'pieces'

describe Piece do
    describe '#initialize' do
        b = Board.new
        pos = [0, 0]
        it 'takes a color, board, and pos' do
            Piece.new(:black, b, pos)
            expect(b.empty?(pos)).to eq(false)
        end
    end

    describe '#to_s' do
        it 'creates a 2 letter representation of a piece' do
            b = Board.new
            pos = [0, 0]
            k = King.new(:black, b, pos)
            expect(k.to_s).to eq('bK ')
        end
    end
    b = Board.new
    r = Rook.new(:black, b, [0, 0])

    describe '#empty?' do
        it 'returns true for null pieces' do
            b = Board.new
            pos = [0, 0]
            expect(b[pos].empty?).to eq(true)
        end
    end

    describe '#symbol' do
        it "returns piece's symbol" do
            expect(r.symbol).to eq('R')
        end
    end

    describe '#name' do
        it "returns piece's name" do
            expect(r.name).to eq('Rook')
        end
    end
end

describe Rook do
    b = Board.new
    r = Rook.new(:black, b, [0, 0])
    describe '#moves' do
        it 'moves horizontally and vertically' do
            expect(r.moves).not_to include([1, 1])
            expect(r.moves).to include([0, 1])
            expect(r.moves).to include([1, 0])
        end
    end
end

describe Knight do
    b = Board.new
    n = Knight.new(:black, b, [0, 0])
    describe '#moves' do
        it 'moves in an L shape' do
            expect(n.moves).not_to include([1, 1])
            expect(n.moves).not_to include([2, 2])
            expect(n.moves).to include([2, 1])
            expect(n.moves).to include([1, 2])
        end
    end
end

describe Bishop do
    b = Board.new
    bishop = Bishop.new(:black, b, [4, 4])
    describe '#moves' do
        it 'moves diagonally' do
            expect(bishop.moves).to include([1, 1])
            expect(bishop.moves).to include([5, 5])
            expect(bishop.moves).not_to include([3, 4])
            expect(bishop.moves).not_to include([4, 3])
        end
    end
end

describe King do
    b = Board.new
    k = King.new(:black, b, [4, 4])
    describe '#moves' do
        it 'moves 1 step in all dirs' do
            expect(k.moves).to include([3, 3])
            expect(k.moves).to include([5, 5])
            expect(k.moves).to include([3, 4])
            expect(k.moves).to include([4, 3])
            expect(k.moves).not_to include([6, 3])
        end
    end
end

describe Queen do
    b = Board.new
    q = Queen.new(:black, b, [4, 4])
    describe '#moves' do
        it 'moves in all dirs' do
            expect(q.moves).to include([3, 5])
            expect(q.moves).to include([7, 7])
            expect(q.moves).to include([4, 0])
            expect(q.moves).to include([7, 4])
            expect(q.moves).not_to include([6, 5])
        end
    end
end

describe Pawn do
    b = Board.new
    p = Pawn.new(:black, b, [1, 4])
    enemy = Pawn.new(:white, b, [2, 5])
    describe '#moves' do
        it 'moves forward one space' do
            expect(p.moves).to include([2, 4])
        end
        it 'moves forward two spaces from starting point' do
            expect(p.moves).to include([3, 4])
        end
        it 'can attack enemies diagonally' do
            expect(p.moves).to include([2, 5])
            expect(enemy.moves).to include([1,4])
        end
        it "doesn't move diagonally to empty spaces" do
            expect(p.moves).not_to include([2, 3])
            expect(enemy.moves).not_to include([1, 6])
        end
    end
end
