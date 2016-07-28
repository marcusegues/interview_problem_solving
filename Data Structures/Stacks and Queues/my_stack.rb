require_relative './stack_methods.rb'

class MyStack
  include StackMethods
  def initialize(length = 10)
    """
    Stack using a fixed size array
    """
    @array = Array.new(length)
    @top = -1
  end

  def clone
    newStack = self.class.new(@array.length)
    newStack.array = @array
    newStack.top = @top
    newStack
  end

  def empty?
    # O(1)
    @top == -1
  end

  def full?
    # O(1)
    @top == @array.length - 1
  end

  def push(value)
    # O(1)
    raise "Stack overflow" if full?
    @top += 1
    @array[@top] = value
  end

  def pop
    # O(1)
    raise "Stack underflow" if empty?
    @top -= 1
    @array[@top + 1]
  end

  def peek
    return nil if empty?
    @array[@top]
  end

  protected
  def array=(array)
    return nil unless array.class == Array
    @array = array
  end

  def top=(value)
    @top = value
  end
end
