class MaxHeap
  attr_accessor :heap_array, :heap_size

  def initialize
    @heap_array = []
    @heap_size = 0
  end

  def parent(i)
    i.odd? ? i/2 : i/2 - 1
  end

  def left(i)
    2*i + 1
  end

  def right(i)
    2*i + 2
  end

  def increase_key(i, value)
    return nil if heap_array[i] >= value
    heap_array[i] = value
    while i > 0 && heap_array[parent(i)] < heap_array[i]
      heap_array[parent(i)], heap_array[i] = heap_array[i], heap_array[parent(i)]
      i = parent(i)
    end
  end

  def insert(value)
    if heap_size == heap_array.length
      heap_array << value - 1
    else
      heap_array[heap_size] = value - 1
    end
    increase_key(heap_size, value)
    @heap_size += 1
  end

  def maximum
    """
    Time complexity: O(1)
    """
    heap_array[0]
  end

  def extract_max
    """
    Time complexity: O(lg n), because of single call to max-heapify
    Space complexity: O(1)
    """
    return nil if heap_size == 0
    max = maximum
    heap_array[0], heap_array[heap_size - 1] = heap_array[heap_size - 1], heap_array[0]
    heap_size -= 1
    max_heapify(0)
    maximum
  end

  def heapsort
    build_max_heap
    (heap_size - 1).downto(0) do |i|
      heap_array[i], heap_array[0] = heap_array[0], heap_array[i]
      heap_size -= 1
      max_heapify(0)
    end
  end

  def build_max_heap
    """
    Call max-heapify on all elements that have at least one child.
    Elements in heap_array[heap_size/2..-1] are leaves, so we don't have to call
    max-heapify on them.
    Time complexity: O(n)
    Naively, we could (correctly) state that the running time is n*lg n, but it is
    more efficient than this. The call to max-heapify is on nodes of different heights.
    lower the height, the more nodes there are at that height, but the smaller the
    number of children of the nodes. So, as we move in the loop below, we have a lot of
    calls to max_heapify with a low n, and as n increases, the number of calls goes down.
    Summing up the work gives us O(n).
    """
    (heap_size/2 - 1).downto(0) do |i|
      max_heapify(heap_array[i])
    end
  end

  def max_heapify(i)
    """
    Assumes that binary trees rooted at left(i) and right(i) are max-heaps, but
    that @heap_array[i] may be smaller than one of it's children, thus violating
    the max-heap property. This method fixes this.

    Time complexity: O(lg n), T(n) = T(2n/3) + O(1)
    * 2n/3 is the worst case size of a subproblem. It happens when the last level
      of the tree is half full. The last level (h) of a complete binary tree has
      2^h nodes (none of which have children). The number of nodes that have children
      is 2^h - 1. Therefore, when the last level is half full, and we recurse on the
      side that has the most nodes, it has 2n/3 of all nodes.
    *
    Space complexity: O(lg n) because of recursion
    """
    l = left(i)
    r = right(i)
    largest = l < heap_size && heap_array[l] > heap_array[i] ? l : i
    largest = r if r < heap_size && heap_array[r] > heap_array[i]
    if largest != i
      heap_array[i], heap_array[largest] = heap_array[largest], heap_array[i]
      max_heapify(largest)
    end
    true
  end

  def print
    p heap_array
  end
end
