class ElfCalorieCounter
  def initialize(file_data)
    @highest_sum = 0
    @elf_with_highest_sum = 0
    @data = scrub_data(file_data)
  end

  def run_count
    @data.each.with_index(1) do |array, index|
      if @highest_sum < array.sum
        @highest_sum = array.sum
        @elf_with_highest_sum = index
      end
    end
  end

  def top_elf
    @elf_with_highest_sum
  end

  def total_calories
    @highest_sum
  end

  private

  def scrub_data(data)
    data
      .gsub(/\n/, ",")
      .split(",")
      .slice_when { |value| value == "" }
      .map { |i| i.map(&:to_i) }
  end
end

file_data = File.read("input.txt")
cal_counter = ElfCalorieCounter.new(file_data)
cal_counter.run_count

puts "Elf ##{cal_counter.top_elf} has the most calories totalling: #{cal_counter.total_calories}"
