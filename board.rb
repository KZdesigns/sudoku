require "tile" #=> allows access to the tile class

class Board
    def self.empty_grid #=> default value for the grid
        Array.new(9) do #=> creating an array that has 9 default values
            Array.new(9) { Tile.new(0) } #=> each one is an array that has 9 tiles 
        end
    end

    def self.from_file(filename) #=> class method that parses a given file into a 2D array
        rows = File.readlines(filename).map(&:chomp) #=> getting each line from the given file 
        tiles = rows.map do |row| #=> itterating through each row
            nums = row.split("").map { |char| Integer(char) } #=> spliting each row on the empty string to isolate the char and maping to an integer
            nums.map { |num| Tile.new(num) } #=> Then maping each num to a tile
        end

        self.new(tiles) #=> creating new board full of tiles
    end

    def initialize(grid = Board.empty_grid) #=> initialzing ::Board with default grid value of an empty grid
        @grid = grid #=> setting the instance grid instance variable to the grid arguement being passed
    end

    def [](pos) #=> Element reference this will return the element at the given position
        row, col = pos #=> assigning the position input to row, and col variables
        grid[row][col] #=> returning the value at grid[row][col] position
    end

    def []=(pos, value) #=> setter method for a new value at a given position
        row, col = pos #=> assigning the values of the given pos to row and col variables
        tile = grid[row][col] #=> indexing the grid at grid[row][col] and assign the tile
        tile.value = value #=> assinging the tile to the new value passed in
    end

    def columns #=> defining what the columns of the grid are
        rows.transpose #=> transposing or flipping the rows
    end

    def render #=> printing for the grid method AKA creating the board
        puts " #{(0..8).to_a.join(' ')}" #=> prints 0-8 on the top row for the top board
        grid.each_with_index do |row, i| #=> itterating through the grid and printing the row and the index
            puts "#{i} #{row.join(' ')}" #=> and adding the index to the start of the new row creating the left border column for the board
        end
    end

    def rows #=> getter for the different rows of the grid aka the grid without the top row and left column 
        grid #=> returning the rows of the game/grid
    end

    def size #=> returns the length of the gride
        grid.size #=> #size is an alias for length
    end

    def solved? #=> boolean for solving the sudoku puzzle
        rows.all? { |row| solved_set?(row) } && #=> check if all the rows have 1-9
        columns.all? { |col| solved_set?(col) } && #=> checking if all the cols have 1-9
        sqaures.all? { |sqaure| solved_set?(sqaure) }
    end

    def solved_set?(tiles) #=> boolean to see if the the set of tiles is solved
        nums = tiles.map(&:value) #=> maping the nums to the values of each tile in the set that was passed to the method
        nums.sort == (1..9).to_a #=> comparing the array of nums (tiles) to [1,2,3,4,5,6,7,8,9]
    end

    def sqaure(idx)

    end

    def sqaures

    end

    def dup

    end

    private

    attr_reader :grid
end

   

# grid = [[0, 0, 3, 0, 2, 0, 6, 0, 0],
#  [9, 0, 0, 3, 0, 5, 0, 0, 1],
#  [0, 0, 1, 8, 0, 6, 4, 0, 0],
#  [0, 0, 8, 1, 0, 2, 9, 0, 0],
#  [7, 0, 0, 0, 0, 0, 0, 0, 8],
#  [0, 0, 6, 7, 0, 8, 2, 0, 0],
#  [0, 0, 2, 6, 0, 9, 5, 0, 0],
#  [8, 0, 0, 2, 0, 3, 0, 0, 9],
#  [0, 0, 5, 0, 1, 0, 3, 0, 0]]