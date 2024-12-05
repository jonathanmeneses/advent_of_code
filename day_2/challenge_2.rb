# Read the input.txt file
input_file_path = 'input.txt'
input_data = File.read(input_file_path)

# Parse each line into an array of integers
lines = input_data.split("\n").map { |line| line.split.map(&:to_i) }

def valid_line?(line)
  check1 = (1...line.length).all? do |i|
    diff = line[i] - line[i-1]
    diff.between?(1, 3)
  end
  check2 = (1...line.length).all? do |i|
    diff = line[i-1] - line[i]
    diff.between?(1, 3)
  end
  check1 || check2
end

def valid_with_one_removal?(line)
  line.each_with_index.any? do |_, index|
    new_line = line.dup
    new_line.delete_at(index)
    valid_line?(new_line)
  end
end

reduced_result = lines.map do |line|
  next 1 if line.length < 2
  valid_line?(line) || valid_with_one_removal?(line) ? 1 : 0
end

puts reduced_result.sum
