# Sudoku
Ruby implementation of a sudoku puzzle game.

## Learning Goals
- Understand what factory methods are and how to use them
- Understand how classes interact and how to use require_relative
- Be able to write and explain how bracket methods [] and []= work
- Be able to use pry to test small parts of your code

## Gameplay - Video
- YouTube Link: https://www.youtube.com/embed/GqGbTHORB3c

## Example Code
```Ruby
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
```
## Preview
![tic-tac-toe-gif](https://media.giphy.com/media/kQkMUidjloJMy8vpDa/giphy.gif)

# Tech Used
- Ruby 3.0
- Ruby 3.0
- Git 2.30.0
- Github
- colorize 0.8.1 URL: https://github.com/fazibear/colorize
