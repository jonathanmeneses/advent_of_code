# Read the input.txt file
input_file_path = 'input.txt'

# Read the content of the file
input_data = File.read(input_file_path) # .split("\n")
# read as text with one array per line

lines = input_data.split("\n")

# Split each line into an array of characters
array_lines = lines.map { |line| line.split('') }

# Setup directions to check
DIRECTIONS = {
  "forward": [0, 1],
  "backward": [0, -1],
  "up": [-1, 0],
  "down": [1, 0],
  "up_right": [-1, 1],
  "up_left": [-1, -1],
  "down_right": [1, 1],
  "down_left": [1, -1],
}

WORD = "XMAS"


# Scan for all x positions, returning an array of [x,y] positions

# RDoc style:
# Finds all X positions in a given grid
# @param grid [Array<Array>] 2D array representing the grid
# @return [Array<Array>] Array of [x,y] coordinates where 'x' is found
def find_x_positions(grid)
  x_positions = []
  grid.each_with_index do |line, y|
    line.each_with_index do |char, x|
      x_positions << [x, y] if char == 'X'
    end
  end
  x_positions
end

def valid_position?(x, y, direction, grid)
  x_end = x + direction[1]*3
  y_end = y + direction[0]*3
  x_end >= 0 && x_end < grid[0].length && y_end >= 0 && y_end < grid.length
end

def check_direction(x, y, direction, grid, word=WORD)
  word.each_char.with_index do |char, index|
    return false if grid[y + direction[0]*index][x + direction[1]*index] != char
  end
  true
end

def find_word_occurrences(x_positions, grid, word = WORD)
  counter = 0
  x_positions.each do |x, y|
    DIRECTIONS.each_value do |direction|
      if valid_position?(x, y, direction, grid)
        check_direction(x, y, direction, grid, word) ? counter += 1 : nil
      end
    end
  end
  return counter
end


x_positions = find_x_positions(array_lines)
puts x_positions.inspect
puts find_word_occurrences(x_positions, array_lines)
