# Read the input.txt file
input_file_path = 'input.txt'
input_data = File.read(input_file_path)

# Parse each line into an array of integers
lines = input_data.split("\n").map { |line| line.split.map(&:to_i) }

def valid_line?(line, direction)
  (1...line.length).all? do |i|
    diff = direction == :increasing ? line[i] - line[i-1] : line[i-1] - line[i]
    diff.between?(1, 3)
  end
end

def valid_with_one_removal?(line, direction)
  line.each_with_index.any? do |_, index|
    new_line = line.dup
    new_line.delete_at(index)
    valid_line?(new_line, direction)
  end
end

reduced_result = lines.map do |line|
  next 1 if line.length < 2

  if line[1] > line[0]
    valid_line?(line, :increasing) || valid_with_one_removal?(line, :increasing) ? 1 : 0
  elsif line[1] < line[0]
    valid_line?(line, :decreasing) || valid_with_one_removal?(line, :decreasing) ? 1 : 0
  else
    valid_with_one_removal?(line, :increasing) || valid_with_one_removal?(line, :decreasing) ? 1 : 0
  end
end

puts reduced_result.sum
