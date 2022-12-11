def scrub_data_and_count(data)
  data
    .gsub(/\n/, ",")
    .split(",")
    .slice_when { |value| value == "" }
    .map { |i| i.map(&:to_i) }
    .map(&:sum)
    .sort
end

data = scrub_data_and_count(File.read("input.txt"))

puts "puzzle 1 answer: #{data.last}"
puts "puzzle 2 answer: #{data.last(3).sum}"
