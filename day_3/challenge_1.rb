# Read the input.txt file
input_file_path = 'input.txt'

# Read the content of the file
input_data = File.read(input_file_path)

numbers_array = input_data.scan(/mul\((\d+),(\d+)\)/).map do |match|
  [match[0].to_i, match[1].to_i]
end

summed_numbers = numbers_array.inject(0) {|sum, array| sum + (array[0] * array[1])}

puts summed_numbers
