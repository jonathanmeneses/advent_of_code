# Read the input.txt file
input_file_path = 'input.txt'

# Read the content of the file
input_data = File.read(input_file_path)

# Import file, with each line as an array
lines = input_data.split("\n")

# Split each line into an array of words with each word as an integer
result = []
lines.each do |line|
  result << line.split.map(&:to_i)
end

# Now that we have each line, go line by line in result and return a value:

reduced_result = result.map do |line|
  if line[1] > line[0]
    valid = true
    (1...line.length).each do |i|
      dif = line[i] - line[i-1]
      if dif < 1 || dif > 3
        valid = false
        break
      end
    end

  elsif line[1] < line[0]
    valid = true
    (1...line.length).each do |i|
      dif = line[i-1] - line[i]
      if dif < 1 || dif > 3
        valid = false
        break
      end
    end
  else
    valid = false
  end
  valid ? 1 : 0
end

puts reduced_result.sum
