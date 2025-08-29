# frozen_string_literal: true

class NiceStringFinder
  attr_reader :strings, :vowel_number

  def initialize(strings, vowel_number)
    @strings = strings
    @vowel_number = vowel_number
  end

  def check_all_requirements?
    n_str = 0
    strings.split("\n").map do |str|
      n_str += contains_three_vowels?(str) && contains_two_chars_in_a_row?(str) && contains_forbiden_strings?(str) ? 1 : 0
    end
    n_str
  end

  private

  def contains_three_vowels?(str)
    str.count('aeiou') >= 3
  end

  def contains_two_chars_in_a_row?(str)
    str.scan(/(.)\1+/).any?
  end

  def contains_forbiden_strings?(str)
    !str.match?(/ab|cd|pq|xy/)
  end
end
