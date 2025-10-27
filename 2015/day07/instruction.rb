class Instruction
  attr_reader :destination

  def initialize(raw_order)
    @destination = raw_order.match(/-> ([a-z]+)$/)[1]
  end

  def evaluate(circuit)
    raise NotImplementedError, "#{self.class} doit implémenter #evaluate"
  end
end
