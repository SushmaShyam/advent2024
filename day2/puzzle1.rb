require 'byebug'
def safe?(levels)
  return false if (levels[0] - levels[1]).abs > 3 || (levels[0] - levels[1]).abs < 1

  trend = levels[0] < levels[1] ? 1 : 2
  levels.each_with_index do |level, index|
    next if index == 0
    return false if (levels[index - 1] - level).abs > 3 || (levels[index - 1] - level).abs < 1
    new_trend = if levels[index - 1] < level
      1
    elsif levels[index - 1] > level
      2
    else
      return false
    end

    return false if new_trend != trend
  end
  return true
end



input = File.read('input.txt')

safe = input.split("\n").select do |report|
  levels = report.split(' ').map(&:to_i)
  safe?(levels)
end

puts safe.count
