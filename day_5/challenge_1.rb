# Read the input.txt file
rules_input_file_path = 'rules.txt'
updates_input_file_path = 'updates.txt'
# Read the content of the file
rules_input_data = File.read(rules_input_file_path).split("\n")
updates_input_data = File.read(updates_input_file_path).split("\n")
# read as text with one array per line

rules = []
rules_input_data.each do |rule|
  rule = rule.split("|")
  rules << [rule[0].to_i, rule[1].to_i]
end

rules_by_first_element = {}
rules.each do |rule|
  if rules_by_first_element[rule[0]].nil?
    rules_by_first_element[rule[0]] = [rule[1]]
  else
    rules_by_first_element[rule[0]] << rule[1]
  end
end

updates = []
updates_input_data.each do |line|
  update = []
  line.split(",").each do |item|
    update << item.to_i
  end
  updates << update
end

def filter_for_rules(update, rules_by_first_element)
  filtered_rules = []
  update.each do |item|
    # for each item, filter for all rules where the item is the first element in the rule
    # add those rules to the filtered_rules array
    rules_by_first_element[item]&.each do |second_element|
      if update.include?(second_element)
        filtered_rules << [item, second_element]
      end
    end
  end
  filtered_rules
end

def valid_update?(update, filtered_rules)
  filtered_rules.each do |rule|
    if update.index(rule[0]) > update.index(rule[1])
      return false
    end
  end
  true
end

def grab_middle_update(update)
  update[update.length/2]
end

valid_updates = []

updates.each do |update|
  filtered_rules = filter_for_rules(update, rules_by_first_element)
  valid_update?(update, filtered_rules) ? valid_updates << update : nil
end

middle_values = valid_updates.map { |update| grab_middle_update(update) }
puts middle_values.sum
