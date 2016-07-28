class MinStack
  attr_accessor :stack, :min
  def initialize
    """
    Stack with a method max that returns the minimum value
    of the stack in O(1) time.
    This version is better than the version that saves min and max in each
    element of the internal stack array. This version keeps less copies of what
    the minimum is, and is thus more efficient in space complexity.
    """
    @stack = []
    @min = []
  end

  def push(value)
    if empty?
      min.push(value)
    else
      min.push(value) if value <= min.last
    end
    stack.push(value)
  end

  def pop
    return nil if empty?
    value = stack.pop
    min.pop if value == minimum
    value
  end

  def minimum
    min.last
  end

  def empty?
    stack.empty?
  end
end
