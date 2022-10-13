class Board
    attr_writer :grid
    def initialize(n)
        @grid = Array.new(n){Array.new(n, '_')}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i and i < @grid.length
        end
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        raise "invalid mark " if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any?{|row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any?{|col| col.all?(mark)}
    end

    def win_diagnol?(mark)
        left_to_right = (0...@grid.length).each do |i|
            pos = [i, i]
            self[pos] == mark
        end
        right_to_left = (0...@grid.length).each do |i|
            row = i
            col = @grid.length - 1 - i
            pos = [row, col]
            self[pos] == mark
        end
        left_to_right == right_to_left
    end

    def win?(mark)
        win_col?(mark) or win_diagnol?(mark) or win_row?(mark)
    end

    def empty_positions?
        (0...@grid.length - 1).each do |i|
            (0...@grid.length - 1).each do |j|
                return true if empty?([i, j])
            end
        end
        false
    end

end
