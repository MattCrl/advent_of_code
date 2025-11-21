class LookAndSay
  attr_reader :input

  def initialize(input)
    @input = input.to_s
  end

  def play_game(rounds_number)
    rounds_number.times do
      @input = @input.chars.chunk(&:itself).map { |_, v| v.join }.map{|a| "#{a.size}#{a[0]}"}.join
    end
    
    @input
  end
end
