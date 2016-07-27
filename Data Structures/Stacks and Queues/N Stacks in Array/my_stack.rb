require_relative './stack_data.rb'
require 'byebug'

class MyStack
  """
  Solution to Cracking the Code Interview problem 3.1
  Use a single array to implement three stacks. In the solution below I
  implement an arbitrary number of stacks in an array.
  Default is three stacks with initial capacity of four elements.
  """
  attr_accessor :number_of_stacks, :total_size, :stack_array, :stacks

  def initialize(number_of_stacks = 3, stack_size = 4)
    @number_of_stacks = number_of_stacks
    @default_size = stack_size
    @total_size = @number_of_stacks * @default_size
    @stack_array = Array.new(@total_size) {0}
    @stacks = Array.new(@number_of_stacks)
    @number_of_stacks.times do |i|
      @stacks[i] = StackData.new(@default_size*i, @default_size)
    end
  end

  def number_of_elements
    """
    Time complexity: O(number of stacks)
    Space complexity: O(1)
    """
    @stacks.inject(0) do |acc, stack|
      acc + stack.size
    end
  end

  def next_element_idx(idx)
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    return 0 if idx == total_size - 1
    idx + 1
  end

  def previous_element_idx(idx)
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    return total_size - 1 if idx == 0
    idx - 1
  end

  def push(stack_num, value)
    """
    Time complexity: O(n) because we must call shift in the worst case
    Space complexity: O(n) because of recursion in shift in worst case
    """
    stack = stacks[stack_num]
    if number_of_elements < total_size
      if stack.size >= stack.capacity
        shift((stack_num + 1) % number_of_stacks)
        stack.capacity += 1
      end
      stack.top = next_element_idx(stack.top)
      stack_array[stack.top] = value
      stack.size += 1
    else
      raise "Stacks are full."
    end
    true
  end

  def shift(stack_num)
    """
    Shift all elements of stack_num to the right by one position. May require first
    a call to shift on the stack to the right of stack_num so that it first shifts
    its own elements to make room for stack_num's shifting of elements.
    Time complexity: O(n), worst case we shift all elements of
      number_of_stacks - 1 stacks
    Space complexity: O(n), because of recursion in the worst case
    """
    stack = stacks[stack_num]
    if stack.size >= stack.capacity
      shift((stack_num + 1) % number_of_stacks)
      stack.capacity += 1
    end

    idx = stack.top + 1
    while stack.isWithinStack(idx, total_size)
      stack_array[idx] = stack_array[idx - 1]
      idx = previous_element_idx(idx)
    end

    stack_array[stack.start] = 0
    stack.start += 1
    stack.top += 1
    stack.capacity -= 1
  end

  def pop(stack_num)
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    stack = stacks[stack_num]
    raise "Stack is empty" if stack.size == 0
    popped = stack_array[stack.top]
    stack_array[stack.top] = 0
    stack.size -= 1
    stack.top = previous_element_idx(stack.top)
    popped
  end

  def peek(stack_num)
    """
    Time complexity: O(1)
    Space complexity: O(1)
    """
    stack = stacks[stack_num]
    return nil if stack.size == 0
    stack_array[stack.top]
  end

  def print_stack_array
    """
    Time complexity: O(n)
    Space complexity: O(1)
    """
    stack_array.each { |value| puts value }
  end
end
