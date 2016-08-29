class MinHeap
  """
  Min priority queue implemented with a min heap.
  Elements in the queue are objects that contain an attribute queue_position,
  an index for the position of the object in the internal min heap array. This
  attribute is updated in min heap operations.
  """
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

  def empty?
    @heap_size == 0
  end

  def exchange_positions(i, j)
    """
    Exchange two nodes in the min heap tree and update their queue_position
    attributes
    Time complexity: O(1)
    Space complexity: O(1)
    """
    heap_array[i].queue_position = j
    heap_array[j].queue_position = i
    heap_array[i], heap_array[j] = heap_array[j], heap_array[i]
  end

  def decrease_key(i, value)
    """
    Decrease the key of a node in the min heap tree. Restores the min heap
    property by moving up the tree through parent relationships.
    Time complexity: O(lg n)
    Space complexity: O(1)
    """
    return nil if heap_array[i] <= value
    heap_array[i].key = value
    while i > 0 && heap_array[parent(i)] > heap_array[i]
      exchange_positions(i, parent(i))
      i = parent(i)
    end
  end

  def insert(obj)
    """
    Insert object into the min heap. Restores the min heap property by
    moving up the tree through parent relationships.
    Time complexity: O(lg n)
    Space complexity: O(1)
    """
    if heap_size == heap_array.length
      heap_array << obj
    else
      heap_array[heap_size] = obj
    end

    heap_array[heap_size].queue_position = heap_size

    i = @heap_size
    @heap_size += 1
    while i > 0 && heap_array[parent(i)] > heap_array[i]
      exchange_positions(i, parent(i))
      i = parent(i)
    end
  end

  def minimum
    """
    Time complexity: O(1)
    """
    heap_array[0]
  end

  def extract_min
    """
    Time complexity: O(lg n), because of single call to min-heapify
    Space complexity: O(1)
    """
    return nil if heap_size == 0
    min = minimum
    exchange_positions(0, heap_size - 1)
    @heap_size -= 1
    min_heapify(0)
    min
  end

  def heapsort
    build_min_heap
    (@heap_size - 1).downto(0) do |i|
      exchange_positions(0, i)
      @heap_size -= 1
      min_heapify(0)
    end
  end

  def build_min_heap
    """
    Call max-heapify on all elements that have at least one child.
    Elements in heap_array[heap_size/2..-1] are leaves, so we don't have to call
    max-heapify on them.
    Time complexity: O(n)
    Naively, we could (correctly) state that the running time is n*lg n, but it is
    more efficient than this. The call to max-heapify is on nodes of different heights.
    lower the height, the more nodes there are at that height, but the smaller the
    number of children of the nodes. So, as we move in the loop below, we have a lot of
    calls to min_heapify with a low n, and as n increases, the number of calls goes down.
    Summing up the work gives us O(n).
    """
    (@heap_size/2 - 1).downto(0) do |i|
      min_heapify(heap_array[i])
    end
  end

  def min_heapify(i)
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
    smallest = l < heap_size && heap_array[l] < heap_array[i] ? l : i
    smallest = r if r < heap_size && heap_array[r] < heap_array[i]
    if smallest != i
      exchange_positions(i, smallest)
      min_heapify(smallest)
    end
    true
  end

  def print
    p heap_array
  end
end
