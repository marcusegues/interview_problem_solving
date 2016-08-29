require_relative './min_heap.rb'

def dijkstra(graph, s)
  """
  Dijkstra's algorithm for the single source shortest path problem.
  Input: weighted graph with nonnegative weights, source vertex
  Time complexity: O(Vlg(V) + Elg(V))
  Space complexity: O(V)
  """
   initialize_single_source(graph, s)
   q = MinHeap.new
   w = Proc.new { |u,v| graph.weight(u,v) }
   graph.vertices.each { |v| q.insert(v) }  # |V| inserts into min heap, O(Vlg(V))

   until q.empty?
     v = q.extract_min  # |V| extract_min calls, O(VlgV)
     graph.adj[v].each { |u| relax(v, u, w, q) }  # each edge relaxed once: O(ElgV)
   end
end

def relax(node1, node2, weights, queue)
  """
  Relaxes edge (node1, node2)
  Time complexity: O(lg V), because of decreaseKey operation on the priority queue.
  Space complexity: O(1)
  """
  new_estimate = node1.d + weights.call(node1, node2)
  queue.decrease_key(node2.queue_position, new_estimate) if node2.d > new_estimate
end

def initialize_single_source(graph, source)
  """
  Initialize parent and shortest path weight estimate on each vertex.
  Time complexity: O(V)
  Space complexity: O(1)
  """
  graph.vertices.each do |vertex|
    vertex.d = Float::INFINITY
    vertex.parent = nil
  end
  source.d = 0
end
