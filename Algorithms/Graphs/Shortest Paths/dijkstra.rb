require_relative './../../Data Structures/Heap/min_heap.rb'

def dijkstra(graph, s)
   initialize_single_source(graph, s)
   q = MinHeap.new
   w = Proc.new { |u,v| graph.weight(u,v) }
   graph.vertices.each { |v| q.insert(v) }
   byebug
   until q.empty?
     v = q.extract_min
     graph.adj[v].each { |u| relax(v, u, w) }
   end
end

def relax(node1, node2, weights)
  new_estimate = node1.d + weights.call(node1, node2)
  node2.d = new_estimate if node2.d > new_estimate
end

def initialize_single_source(graph, source)
  graph.vertices.each do |vertex|
    vertex.d = Float::INFINITY
    vertex.parent = nil
  end
  source.d = 0
end
