class MinMaxStack
  """
  Stack with a method max that returns the maximum and minimum values
  of the stack in O(1) time.
  """
  def initialize
    @stack = []
  end

  def length
    @stack.length
  end

  def top
    @stack.last
  end

  def <<(value)
    new_max = @stack.empty? ? value : [value, max].max
    new_min = @stack.empty? ? value : [value, min].min
    @stack << {value: value, max: new_max, min: new_min}
  end

  def pop
    (@stack.pop)[:value]
  end

  def max
    empty? ? nil : top[:max]
  end

  def min
    empty? ? nil : top[:min]
  end

  def empty?
    @stack.empty?
  end
end
