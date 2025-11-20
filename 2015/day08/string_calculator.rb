# frozen_string_literal: true

class StringCalculator
  attr_reader :lines

  def initialize(lines)
    @lines = lines
  end

  def calculate_escaped_chars
    total_non_escaped = 0
    total_escaped = 0
    lines.each do |line|
      total_non_escaped += line.size

      line = replace_escaped_chars(line)
      
      total_escaped += line.size - 2 # -2 for the double quotes at the start/end of every line
    end

    puts "part 1 = #{total_non_escaped - total_escaped}"
  end

  def calculate_escaped_chars_p2
    total_non_escaped = 0
    total_escaped = 0
    lines.each do |line|
      total_non_escaped += line.size

      line = replace_escaped_chars_p2(line)
      
      total_escaped += line.size + 4 # +4 for the double quotes at the start/end of every line
    end

    puts "part 2 = #{total_escaped - total_non_escaped }"
  end

  private

  def replace_escaped_chars(line)
    line = line.gsub(/\\x[0-9a-fA-F]{2}/, ".")
    line = line.gsub(/\\\\/, ".")
    line = line.gsub(/\\\"/, ".")
    line
  end

  def replace_escaped_chars_p2(line)
    line = line.gsub(/\\x[0-9a-fA-F]{2}/, ".....")
    line = line.gsub(/\\\\/, "....")
    line = line.gsub(/\\\"/, "....")
    line
  end
end
