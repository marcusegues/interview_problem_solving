require_relative './my_static_array.rb'

class MyQueue
  attr_reader :tail, :head
  def initialize(length = 10)
    """
    Queue using a fixed size array
    """
    @array = Array.new(length)
    @head, @tail = 0, 0
  end

  def full?
    # O(1), checks if @head is @tail + 1
    (@tail + 1) % @array.length == @head
  end

  def empty?
    # O(1)
    @tail == @head
  end

  def enqueue(value)
    # O(1)
    raise "Queue is full" if full?
    @array[@tail] = value
    @tail = (@tail + 1) % @array.length
  end

  def dequeue
    # O(1)
    raise "Queue is empty" if empty?
    @head = (@head + 1) % @array.length
  end
end
