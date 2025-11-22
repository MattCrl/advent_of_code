# frozen_string_literal: true

class Password
  attr_reader :forbidden_letters, :forbidden_words, :password, :valid_password

  def initialize(forbidden_letters, forbidden_words, password)
    @forbidden_letters = forbidden_letters
    @forbidden_words = forbidden_words
    @password = password
    @valid_password = false
  end

  def find_next_valid_password
    while !@valid_password
      @password = @password.next
      if @forbidden_words.any? { |word| @password.include?(word) } && !(@forbidden_letters.any? { |word| @password.include?(word) }) && (@password.scan(/(.)\1/).uniq.count > 1)
        @valid_password = true
      end
    end

    @password
  end
end
