require_relative "board" #=> giving access to the board.rb file/class

class SudokuGame

    def self.from_file(filename) #=> class method for creating a new board
        board = Board.from_file(filename) #=> seting board equal to the Board.from_file from board.rb 
        self.new(board) #=> setting the object equal to the board passed in
    end

    def initialize(board) #=> how to start a new board object
        @board = board #=> setting the board instance variable to the board passed in
    end

    def get_pos #=> getting positoins from users
        pos = nil #=> setting pos variable to nil
        until pos && valid_pos?(pos) #=> repeat below until pos is something other than nil and the pos is valid postion on the board '3,4'
            puts "Please enter a position on the board (e.g., '4,7')" #=> prinitng a message directing the user
            print "> " 
            pos = parse_pos(gets.chomp) #=> getting input from user and passing it to #parse_pos
        end
        pos #=> returning the pos variable 
    end

    def get_val #=> same as get pos but for getting a value from the user
        val = nil #=> setting value variable to nil
        until val && valid_val?(val) #=> until the value is a valid puts and print message and accept new user input 
            puts "Please enter a value between 1 and 9 (0 to clear the title)"
            print "> "
            val = parse_val(gets.chomp) #=> recieving user input and parsing or passing it to #parse_val
        end
        val #=> returning the value
    end

    def parse_pos(string) #=> method for parsing user input for a position
        string.split(",").map { |char| Integer(char) } #=> taking the string '4,3' and mapping it to [4,3]
    end

    def parse_val(string) #=> taking in the value as a string
        Integer(string) #=> turing the value into an integer
    end

    def play_turn #=> method for playing a turn
        board.render #=> rendering a board
        pos = get_pos #=> setting the position for the turn
        val = get_val #=> setting the value for the turn
        board[pos] = val #=> setting teh value to the the position given
    end

    def run #=> running game
        play_turn until solved? #=> keep playing game until the solved? == true
        board.render #=> Once sovled render the solved board
        puts "Congratulations, you win!" #=> puts winning message
    end

    def solved? #=> enabling board.solved? to be solved? giving access to run method
        board.solved?
    end

    def valid_pos?(pos) #=> checking is the pos is a valid position
        pos.is_a?(Array) && #=> is the pos an array?
        pos.length == 2 && #=> is the pos array length == 2?
        pos.all? { |x| x.between?(0, board.size - 1) } #=> and do all the integers in pos fit into the board
    end #=> if all things are true return true

    def valid_val?(val) #=> checking to see if the value is valid
        val.is_a?(Integer) && #=> checking the value is an array
        val.between?(0, 9) #=> is the value between 0-9
    end #=> if all things are true return ture

    private

    attr_reader :board #=> giving acess to read the board instance variable 
end

#=> uncomment below to play game replace "filename" with any .txt file in the puzzles folder or create your own and add it the folder
SudokuGame.from_file("puzzles/sudoku_example.txt").run

