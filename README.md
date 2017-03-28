#Instructions for Use

Requires Ruby and Rspec.

To set up: `gem install bundle`, then `bundle install rspec`

To test: run `rspec`

To run without Rspec: Go to `game.rb` and uncomment the two bottom lines, then run `ruby lib/game.rb` from the main directory.

Alternatively, load `game.rb` in pry and create a new instance of `Game`, then call `run` on that instance.

##How to set up board:

When the game is run, the console will ask for an input of 4 characters. The first two are the chessboard coordinates (between A1 and H8). The third is the color of the piece to be placed (b or w). The fourth is the type of piece, these are denoted by the first letter of the piece's name. Note that King is `k` and Knight is `n`. All letters must be lowercase.

For example, `c3bn` places a black Knight at C3, `d1wp` places a white pawn at D1.
