class LookAndSay
  attr_reader :input

  def initialize(input)
    @input = input.to_s
  end

  def play_game(rounds_number)
    rounds_number.times do
      @input = @input.gsub(/(.)\1*/) { |match| "#{match.size}#{match[0]}" }
    end

    @input
  end
end
