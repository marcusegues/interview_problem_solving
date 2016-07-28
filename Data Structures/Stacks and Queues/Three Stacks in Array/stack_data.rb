class StackData
  attr_accessor :start, :top, :capacity, :size
  def initialize(start, capacity)
    @start = start
    @top = @start - 1
    @capacity = capacity
    @size = 0
  end

  def isWithinStack(idx, total_stack_array_size)
    if start < idx && idx < start + capacity  # normal case of no wrapping
      return true
    else
      if (start + capacity) > total_stack_array_size &&  # wrapped idx
        idx < (start + capacity) % total_stack_array_size
        return true
      end
    end
  end
end
