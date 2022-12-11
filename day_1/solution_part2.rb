def scrub_data_and_count(data)
  data
    .gsub(/\n/, ",")
    .split(",")
    .slice_when { |value| value == "" }
    .map { |i| i.map(&:to_i) }
    .map(&:sum)
    .sort
end

file_data = File.read("input.txt")
puts scrub_data_and_count(file_data).last(3).sum

