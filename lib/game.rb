class Game
    # include Players::Human
    # include Players::Computer

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ]

    attr_accessor :player_1, :player_2, :board

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2
    end
    
    def won?
        WIN_COMBINATIONS.any? { |winning_combo|
            return winning_combo if winning_combo.all? { |el| self.board.cells[el] == "X" } || winning_combo.all? { |el| self.board.cells[el] == "O" }
        }
    end

    def draw?
        self.board.full? && !self.won?
    end

    def over?
        self.draw? || self.won?
    end

    def winner
        self.board.cells[self.won?[0]] if self.won?
    end

    def turn
        current_move = current_player.move(self.board)
        if self.board.valid_move?(current_move)
            self.board.update(current_move, current_player)
        else
            turn
        end
    end

    def play
        # puts "\n= NEW GAME =\n"
        # self.board.display
        while true
            break if self.over?
            self.turn
            # self.board.display
        end
        message = self.winner ? "Congratulations #{self.winner}!" : "Cat's Game!"
        puts message
    end
end