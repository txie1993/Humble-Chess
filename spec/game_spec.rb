require 'rspec'
require 'game'

describe Game do
    subject(:game) { Game.new }

    describe '#get_command' do
      before do
        $stdin = StringIO.new("stop")
      end

      after do
        $stdin = STDIN
      end
        it 'requests an input of a string and stops when the user inputs stop' do
          expect(game.get_command).to be == 'stop'
        end
    end

    describe '#get_current_color' do
      before do
        $stdin = StringIO.new("b")
      end

      after do
        $stdin = STDIN
      end
        it 'requests a letter input and returns a color symbol' do
          expect(game.get_current_color).to eq(:black)
        end
    end
end
