input = File.read('input.txt')
first_list = []
second_list = []
location_ids = input.split("\n").map do |line|
  first_list << line.split(' ').first.to_i
  second_list << line.split(' ')[1].to_i
end
distance = first_list.map do |first|
  second_list.count(first) * first
end.sum
puts distance
