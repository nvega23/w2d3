class HumanPlayer
    attr_reader :mark
    def initialize(val)
        @mark = val
    end

    def get_position
        puts "Player #{@mark.to_s}: enter two numbers "
        pos = gets.chomp.split(" ").map(&:to_i)
        raise "invalid position " if pos.length != 2
        pos
    end
end
