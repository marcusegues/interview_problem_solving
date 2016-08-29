def bellman_ford(graph, source)
  """
  Bellman-ford algorithm for solving single-source shortest paths problem when
  the graph may have negative-weight cycles
  Time complexity: O(VE)
  Space complexity: O(1)
  """
  initialize_single_source(graph, source)
  weights = Proc.new { |n1, n2| graph.weight(n1, n2) }
  (graph.vertices.length - 1).times do  # Shortest paths have at most |V| - 1 edges
    graph.vertices.each do |u|
      graph.adj[u].each { |v| relax(u, v, weights) }
    end
  end

  graph.vertices.each do |u|
    graph.adj[u].each do |v|
      return false if v.d > u.d + graph.weight(u,v)
    end
  end
end

def relax(node1, node2, weights)
  """
  Relaxes edge (node1, node2)
  Time complexity: O(lg V), because of decreaseKey operation on the priority queue.
  Space complexity: O(1)
  """
  new_estimate = node1.d + weights.call(node1, node2)
  node2.d = new_estimate if node2.d > new_estimate
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
