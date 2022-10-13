require "./human_player.rb"
class ComputerPlayer
    attr_reader :mark
    def initialize(val)
        @mark = val
    end

    def get_position(legal_positions)
        output = legal_positions.sample
        puts "Computer #{self.mark} chose position #{output.to_s}"
        output
    end

end
