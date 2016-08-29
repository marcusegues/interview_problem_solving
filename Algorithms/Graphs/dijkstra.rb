# shortest-path algorithm
# have to augment graph nodes with

# q = min priority queue
# push all vertices in g.adj into q keyed by their d estimates
# until q is empty, extract the min priority node
# relax all its edges
def dijkstra(graph, w, s)
  
end

def relax(node1, node2, weights, result)
  new_estimate = result.estimate[node1] + weights(node1, node2)
  result.estimate[node2] = new_estimate if result.estimate[node2] > new_estimate
end

def initialize(graph, source)
  graph.adj.each do |n|
    result.estimate[n] = Float::Infinity
    result.parent[n] = nil
  end
end

class DijkstraResult
  def initialize
    @estimate = {}
    @parent = {}
  end
end
