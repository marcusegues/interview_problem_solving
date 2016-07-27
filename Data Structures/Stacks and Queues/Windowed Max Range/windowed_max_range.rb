require_relative "./min_max_stack_queue.rb"

class WindowedMaxRange
  """
  Given an array, and a window size w, find the maximum max - min within a
  range of w elements.
  """
  def initialize(arr = [], window_size = [])
    @arr = arr
    @window_size = window_size
  end

  def calculate_max_range_in_window
    """
    Time complexity: O(n)
    Space complexity: O(1)
    """
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
