class SetOfStacks
  """
  Cracking the code interview problem 3.3
  This object behaves like a stack, but is composed of multiple stacks of a
  fixed size. As elements are pushed onto this object, new internal stacks are
  created as the previous internal stacks reach capacity.
  """
  attr_accessor :stacks, :current
  attr_reader :max_stack_size

  def initialize(max_stack_size = 3)
    @max_stack_size = max_stack_size
    @stacks = [[]]
    @current = 0
  end

  def popAt(idx)
    """
    pop operation on a specific sub-stack
    Time complexity: O(n) because of left-shifting
    Space complexity: O(max_stack_size) because of left-shifting
    """
    popped = stacks[idx].last
    left_shift(idx + 1)
    popped
  end

  def left_shift(idx)
    """
    Shifts stack idx and all subsequent stacks left by one position.
    Time complexity: O(n), where n is the total stack size
    Space complexity: O(max_stack_size), ie, the max size of a sub-stack
    """
    idx.upto(current) do |i|
      previous_stack = stacks[i - 1]
      current_stack = stacks[i]
      previous_stack[-1] = current_stack[0]
      (current_stack.length - 1).times do |j|
        current_stack[j] = current_stack[j+1]
      end
      current_stack.pop if i == current
    end
  end

  def push(value)
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    stack = @stacks[current]
    stack << value
    start_new_stack if full?
  end

  def pop
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    if stacks[@current].empty?
      raise "empty stack" if @current == 0
      @current -= 1
      stacks.pop
    end
    stacks[@current].pop
  end

  def start_new_stack
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    stacks << []
    @current += 1
  end

  def empty?
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    stacks[current].length == 0
  end

  def full?
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    stacks[current].length == max_stack_size
  end

  def print
    """
    Time complexity: O(n)
    Space complexity: O(1)
    """
    count = current
    count.downto(0) do |i|
      (stacks[i].length).downto(0).each { |j| puts stacks[i][j] }
    end
  end
end
