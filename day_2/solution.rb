def scrub_and_transform_data(data)
  clean_data =
    data
      .gsub(/\n/, ",")
      .split(",")
      .map { |v| v.split(" ") }

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


  clean_data.map {|d| cheat_sheet[d] }
end

puts scrub_and_transform_data(File.read("input.txt")).sum



