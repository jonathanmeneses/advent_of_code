# Read the input.txt file
input_file_path = 'input.txt'

# Read the content of the file
input_data = File.read(input_file_path)

# Print the content of the file
#
lines = input_data.split("\n")

column1 = []
column2 = []
distance_array = []
distance = 0
distance2 = 0

lines.each do |line|
  values = line.split
  column1 << values[0].to_i
  column2 << values[1].to_i

  distance += (values[1].to_i - values[0].to_i).abs
end

sorted_column1 = column1.sort
sorted_column2 = column2.sort

sorted_column1.each_with_index do |value1, index|
  val2 = sorted_column2[index]
  distance2 += (val2 - value1).abs
  distance_array << (val2 - value1).abs
end


puts "The distance is #{distance}"
puts "The distance is #{distance2}"
# puts distance_array
