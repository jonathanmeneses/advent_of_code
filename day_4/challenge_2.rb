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
def find_a_positions(grid)
  a_positions = []
  grid.each_with_index do |line, y|
    line.each_with_index do |char, x|
      a_positions << [x, y] if char == 'A'
    end
  end
  a_positions
end

def valid_position?(x, y, grid)
  x - 1 >= 0 && x + 1 < grid[0].length && y - 1 >= 0 && y + 1 < grid.length
end

def check_for_cross(x, y, grid)
  return false if grid[y][x] != 'A'

  cross1 = (grid[y + 1][x + 1] == 'M' && grid[y - 1][x - 1] == 'S') ||
           (grid[y + 1][x + 1] == 'S' && grid[y - 1][x - 1] == 'M')
  cross2 = (grid[y + 1][x - 1] == 'M' && grid[y - 1][x + 1] == 'S') ||
           (grid[y + 1][x - 1] == 'S' && grid[y - 1][x + 1] == 'M')
  cross1 && cross2
end

def find_cross_occurrences(a_positions, grid)
  counter = 0
  a_positions.each do |x, y|
    if valid_position?(x, y, grid)
      check_for_cross(x, y, grid) ? counter += 1 : nil
    end
  end
  return counter
end

a_positions = find_a_positions(array_lines)
puts find_cross_occurrences(a_positions, array_lines)
