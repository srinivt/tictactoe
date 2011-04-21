module TicTacToe
  class Board
    attr_accessor :board, :b
    
    def initialize
      @board = @b = [
          [nil,nil,nil],
          [nil,nil,nil],
          [nil,nil,nil] 
        ]
    end
    
    def each_row(&block)
      board.each { |r| yield r } if block_given?
    end
    
    def each_col(&block)
      3.times { |i| yield [b[0][i - 1], b[1][i - 1], b[2][i - 1]] } if block_given?
    end
    
    def each_diagonal(&block)
      if block_given?
        yield [b[0][0], b[1][1], b[2][2]]
        yield [b[0][2], b[1][1], b[2][0]]
      end
    end
    
    def print
      puts "\n" + board.map { |row| row.map { |e| e || " " }.join("|") }.join("\n")
    end
    
    def moves_made
      board.flatten.compact.size
    end
    
    def make_move!(player, r, c)      
      board[r][c] = player
    end
    
    def legal_move?(r, c)
      (0..2).include?(r) && (0..2).include?(c) && board[r][c].nil?
    end
  end
end