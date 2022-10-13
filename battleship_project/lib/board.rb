class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end

    def size
        @size
    end
# [] = board instance method
    def [](pos) #[row, column]
        #pos = [1, 2]
        # row, col = pos
        row = pos[0]
        col = pos[1]
        @grid[row][col]
        #[[],[],[]]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end
# self = board instance
    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship! '
            return true
        else
            self[pos] = :X
            return false
        end
    end
# # = instance method
# :: = self; self.blank
# class method gets called on the class name

    def place_random_ships
        max_ships = self.size * 0.25
        while self.num_ships < max_ships
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
