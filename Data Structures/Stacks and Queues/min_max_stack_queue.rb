require_relative "./min_max_stack.rb"
require_relative "./stack_queue.rb"

class MinMaxStackQueue < StackQueue
  def initialize
    @in, @out = MinMaxStack.new, MinMaxStack.new
  end

  def length
    @in.length + @out.length
  end

  def empty?
    @in.empty? && @out.empty?
  end

  def max
    if @in.empty? || @out.empty?
      return @in.max || @out.max
    else
      return @in.max > @out.max ? @in.max : @out.max
    end
  end

  def min
    if @in.empty? || @out.empty?
      return @in.min || @out.min
    else
      return @in.min < @out.min ? @in.min : @out.min
    end
  end

  def range
    return nil if empty?
    max - min
  end
end
