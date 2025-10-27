class AssignmentInstruction < Instruction
  attr_reader :source

  def initialize(raw_order)
    super
    match = raw_order.match(/^([a-z\d]+) -> /)
    @source = match[1]
  end

  def evaluate(circuit)
    value = circuit.get_signal(@source)
    if value
      circuit.set_signal(@destination, value)
      return true
    end
    false
  end
end

class AndInstruction < Instruction
  attr_reader :left, :right

  def initialize(raw_order)
    super
    match = raw_order.match(/^([a-z\d]+) AND ([a-z\d]+) -> /)
    @left = match[1]
    @right = match[2]
  end

  def evaluate(circuit)
    left_val = circuit.get_signal(@left)
    right_val = circuit.get_signal(@right)

    if left_val && right_val
      circuit.set_signal(@destination, left_val & right_val)
      return true
    end
    false
  end
end

class NotInstruction < Instruction
  attr_reader :source

  def initialize(raw_order)
    super
    match = raw_order.match(/^NOT ([a-z]+) -> /)
    @source = match[1]
  end

  def evaluate(circuit)
    source_val = circuit.get_signal(@source)
    if source_val
      circuit.set_signal(@destination, (~source_val) & 0xFFFF)
      return true
    end
    false
  end
end

class OrInstruction < Instruction
  attr_reader :left, :right

  def initialize(raw_order)
    super
    match = raw_order.match(/^([a-z\d]+) OR ([a-z\d]+) -> /)
    @left = match[1]
    @right = match[2]
  end

  def evaluate(circuit)
    left_val = circuit.get_signal(@left)
    right_val = circuit.get_signal(@right)

    if left_val && right_val
      circuit.set_signal(@destination, left_val | right_val)
      return true
    end
    false
  end
end

class LShiftInstruction < Instruction
  attr_reader :left, :right

  def initialize(raw_order)
    super
    match = raw_order.match(/^([a-z\d]+) (LSHIFT) ([a-z\d]+) -> /)
    @left = match[1]
    @right = match[3]
  end

  def evaluate(circuit)
    left_val = circuit.get_signal(@left)
    right_val = circuit.get_signal(@right)

    if left_val && right_val
      circuit.set_signal(@destination, left_val << right_val)
      return true
    end
    false
  end
end

class RShiftInstruction < Instruction
  attr_reader :left, :right

  def initialize(raw_order)
    super
    match = raw_order.match(/^([a-z\d]+) (RSHIFT) ([a-z\d]+) -> /)
    @left = match[1]
    @right = match[3]
  end

  def evaluate(circuit)
    left_val = circuit.get_signal(@left)
    right_val = circuit.get_signal(@right)

    if left_val && right_val
      circuit.set_signal(@destination, left_val >> right_val)
      return true
    end
    false
  end
end
