require_relative "tile" #=> allows access to the tile class

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
        sqaures.all? { |sqaure| solved_set?(sqaure) } # => check if all sqaures have the numbers 1-9
    end

    def solved_set?(tiles) #=> boolean to see if the the set of tiles is solved
        nums = tiles.map(&:value) #=> maping the nums to the values of each tile in the set that was passed to the method
        nums.sort == (1..9).to_a #=> comparing the array of nums (tiles) to [1,2,3,4,5,6,7,8,9]
    end

    def sqaure(idx) #=> method for creating squares
        tiles = [] #=> creating an empty array to hold the tiles that make up sqaure
        x = (idx / 3) * 3 #=> setting x variable to represent the square moving across
        y = (idx % 3) * 3 #=> setting y variable to represent the different square heights

        (x...x + 3).each do |i| #=> looping through all the possible horizontal tiles in the square
            (y...y + 3).each do |j| #=> looping through the possible veritcal value tiles in the square
                tiles << self[[i,j]] #=> adding the cordinates of the grid into the tiles array holding to create a square
            end
        end

        tiles #=> returning the tiles array or square
    end

    def sqaures #=> method for creating all the square in on the board
        (0..8).to_a.map { |i| sqaure(i) } #=> maping the different squares on the board
    end

    def dup #=> making a copy of the grid
        duped_grid = grid.map do |row| #=> looping the each row of the grid
            row.map { |tile| Tile.new(tile.value) } #=> mapping each tile to a new tile
        end

        Board.new(duped_grid) #=> creating a new board with the copied values
    end

    private

    attr_reader :grid #=> giving read only access to the grid instance variable
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


