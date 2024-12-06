# Read the input.txt file
input_file_path = 'input.txt'

# Read the content of the file
input_data = File.read(input_file_path)
# stripped_input = input_data.scan(/don't\(\)|do\(\)|mul\((\d+),(\d+)\)/)
stripped_input = input_data.scan(/(do\(\)|don't\(\)|mul\((\d+),(\d+)\))/)


sum_counter = 0
active = true
stripped_input.each do |match|
  if match[0] == "do()"
    active = true
  elsif match[0] == "don't()"
    active = false
  elsif active
    sum_counter += match[1].to_i * match[2].to_i
  end
end
puts sum_counter

# strip out characters between dont() and do()
# grab numbers
