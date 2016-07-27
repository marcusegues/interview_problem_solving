class StackQueue
  """
  Queue implemented using stacks
  Enqueue and dequeue use only push and pop operations
  """
  def initialize
    @in, @out = [], []
  end

  def enqueue(value)
    # O(1)
    @in << value
  end

  def dequeue
    # Time complexity: O(n) worst case, O(1) ammortized
    if @out.empty?
      @out << @in.pop until @in.empty?
    end

    @out.pop
  end
end
