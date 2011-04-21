module TicTacToe
  class Player
    attr_accessor :code, :board
    
    def initialize(c, b)
      @code = c
      @board = b
    end
    
    def to_s
      code.to_s
    end
    
    def get_move
      print "\n #{code}'s move>> "
      r, c = gets.split.map { |e| e.to_i }
      return r, c
    end
    
    def play
      r = c = -1
      
      do
        r, c = player.get_move 
      until board.valid_move?(r, c)
      
      board.make_move!(player, r, c)
    end
  end
end