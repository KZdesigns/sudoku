require 'colorize' #=> requiring in colorize gem

class Tile
    attr_reader :value #=> giving read only access to value instance variable

    def initialize(value) #=> initializing tile object passing a single value
        @value = value #=> value instance variable being set to the value passed into Tile.new(value)
        @given = value == 0 ? false : true #=> given instance variable is a boolen if value passed in is 0 set given to false, otherwise true
    end

    def color #=> method to assign color to the tile
        given? ? :blue : :red #=> if given is true tile is :blue otherwise :red
    end

    def given? #=> getter for given instance variable value (true or false)
        @given
    end

    def to_s #=> method turns value into a string
        value == 0 ? " " : value.to_s.colorize(color)
        #=> if value equals 0 to_s return " ", otherwise turns the value to a string and uses colorize method and pass the value of color method on line 11
    end

    def value=(new_value) # setter method for the value
        if given? #=> checking to see if the tile is given
            puts "Invalid move can't change a value of a given tile"
            #=> if it is puts message above
        else #=> if not given set the value instance to the new_value passed in
            @value = new_value
        end
    end
end

