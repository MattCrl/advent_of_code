class Circuit
  def initialize(raw_orders)
    @signals = {}
    @instructions = parse_orders(raw_orders)
  end

  def set_signal(wire, value)
    @signals[wire] = value
  end

  def get_signal(source)
    if source.match?(/^[a-z]+$/)
      return @signals[source]
    end
    if source.match?(/^\d+$/)
      return source.to_i
    end
    nil
  end

  def solve(target_wire = nil)
    until @instructions.empty?
      instructions_before = @instructions.count
      
      @instructions.delete_if do |instruction|
        instruction.evaluate(self)
      end

      if instructions_before == @instructions.count
        puts "Erreur : boucle infinie, il reste #{@instructions.count} non résolue."
        break
      end
    end
    
    target_wire ? @signals[target_wire] : @signals
  end

  private def parse_orders(raw_orders)
    raw_orders.map do |order|
      case order
      when /^NOT/
        NotInstruction.new(order)
      when /AND/
        AndInstruction.new(order)
      when /OR/
        OrInstruction.new(order)
      when /LSHIFT/
        LShiftInstruction.new(order)
      when /RSHIFT/
        RShiftInstruction.new(order)
      when /->/
        AssignmentInstruction.new(order)
      else
        raise "Instruction inconnue: #{order}"
      end
    end
  end
end
