require_relative "./min_max_stack_queue.rb"

class WindowedMaxRange
  def initialize(arr = [], window_size = [])
    @arr = arr
    @window_size = window_size
  end

  def calculate
    @q = MinMaxStackQueue.new
    @max_range = @q.range
    @arr.each do |el|
      @q.enqueue(el)
      if @max_range.nil? || @q.range > @max_range
        @max_range = @q.range
      end
      @q.dequeue if @q.length == @window_size
    end
    @max_range
  end
end
