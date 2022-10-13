require './board.rb'
require './human_player.rb'
class Game
    def initialize(n, *marks)
        @board = Board.new(n)
        @players = marks.map do |mark|
            HumanPlayer.new(mark)
        end
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts 'victory '
                puts @current_player.mark.to_s + ' HAS WON!'
            else
                switch_turn
            end
        end
        puts 'Game Over'
        puts 'DRAW'
    end


end
