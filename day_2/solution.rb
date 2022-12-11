def scrub_and_transform_data(data)
  clean_data =
    data
      .gsub(/\n/, ",")
      .split(",")
      .map { |v| v.split(" ") }
end

def puzzle_one(data)
  cheat_sheet = {
    ["A", "X"] => 4, # rock vs rock = 1 + 3 -> tie
    ["A", "Y"] => 8, # rock vs paper = 2 + 6 -> win
    ["A", "Z"] => 3, # rock vs scissors = 3 + 0 -> lose
    ["B", "X"] => 1, # paper vs rock = 1 + 0 -> lose
    ["B", "Y"] => 5, # paper vs paper = 2 + 3 -> tie
    ["B", "Z"] => 9, # paper vs scissors = 3 + 6 -> win
    ["C", "X"] => 7, # scissors vs rock = 1 + 6 -> win
    ["C", "Y"] => 2, # scissors vs paper 2 + 0 = -> lose
    ["C", "Z"] => 6, # scissors vs scissors 3 + 3 = -> tie
  }

  scrub_and_transform_data(data).map {|d| cheat_sheet[d] }
end

def puzzle_two(data)
  cheat_sheet = {
    ["A", "X"] => 3, # rock vs scissors = 3 + 0 -> lose
    ["A", "Y"] => 4, # rock vs rock = 1 + 3 -> tie
    ["A", "Z"] => 8, # rock vs paper = 2 + 6 -> win
    ["B", "X"] => 1, # paper vs rock = 1 + 0 -> lose
    ["B", "Y"] => 5, # paper vs paper = 2 + 3 -> tie
    ["B", "Z"] => 9, # paper vs scissors = 3 + 6 -> win
    ["C", "X"] => 2, # scissors vs paper 2 + 0 = -> lose
    ["C", "Y"] => 6, # scissors vs scissors 3 + 3 = -> tie
    ["C", "Z"] => 7, # scissors vs rock = 1 + 6 -> win
  }

  scrub_and_transform_data(data).map {|d| cheat_sheet[d] }
end

file_data = File.read("input.txt")

puts "Puzzle 1: #{ puzzle_one(file_data).sum }"
puts "Puzzle 2: #{ puzzle_two(file_data).sum }"



