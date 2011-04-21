module TicTacToe
  class Game
    attr_reader :board, :players, :state, :winner

    def initialize
      @board = TicTacToe::Board.new
      @players = [:X, :O].map { |c| TicTacToe::Player.new(c, @board) }.cycle
      @state = :ON
      @winner = nil
    end
    
    def won?
      check_for_win = proc do |r| 
        if r.uniq.size == 1 && !r[0].nil? 
          puts "#{r[0]} wins!!" ; return true
        end
      end
      
      board.each_row { |r| check_for_win[r] }
      board.each_col { |c| check_for_win[c] }
      board.each_diagonal {|d| check_for_win[d] }
    end
    
    def drawn?
      if board.moves_made == 9
        puts "Game drawn!"
        true
      end
    end
    
    def play
      board.print  
      players.next.play until won? or drawn?
    end
  end
end
