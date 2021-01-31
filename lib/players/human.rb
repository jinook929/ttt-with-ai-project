module Players
  class Human < Player
    def move(board)
      board.display
      puts "\n#{self.token}, what will be your next move?"
      input = gets.strip
    end
  end
end
