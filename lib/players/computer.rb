module Players
  class Computer < Player
    def move(board)
      puts "\nHere comes AI's move! [#{self.token}]"
      available = []
      board.cells.each_with_index { |v, i| available << i + 1 if v == " " }
      input = available[rand(1..available.count) - 1].to_s
    end
  end
end
