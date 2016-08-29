require_relative "./Data Structures/Heap/min_heap.rb"

class Event
  include Comparable

  def initialize(type, height, x_coord)
    @type = type
    @height = height
    @x_coord = x_coord
  end

  def <=>(other)
    @x_coord <=> other.x_coord
  end
end

def skyline(coordinates)
  """
  Problem description: https://uva.onlinejudge.org/external/1/p105.pdf
  Time complexity: O(nlgn)
  Space complexity: O(n)
  """
  t = AVL.new
  q = MinHeap.new

  coordinates.each do |c|
    q.insert(Event.new("add", c[1], c[0]])
    q.insert(["rem", c[1], c[2]])
  end

  last_height = -1
  last_x = -1
  result = []

  while !q.empty?
    event = q.extract_min
    if event.type = "add"
      t.insert(event.height)
    else
      t.delete(event.height)
    end
    x = event.x_coord
    max_height = t.max

    if max_height != last_height
      if x != last_x
        result.concat([x, max_height])
      else
        result[-1] = max_height
      end
    end

    last_x = x
    last_height = max_height
  end
end
