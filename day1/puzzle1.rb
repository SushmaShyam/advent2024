input = File.read('input.txt')
first_list = []
second_list = []
location_ids = input.split("\n").map do |line|
  first_list << line.split(' ').first.to_i
  second_list << line.split(' ')[1].to_i
end
first_list.sort!
second_list.sort!
distance = first_list.zip(second_list).map do |first, second|
  (first - second).abs
end.sum
puts distance
