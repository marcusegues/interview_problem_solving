require_relative './bfs_result.rb'

def bfs(graph, source)
  """
  Breadth-first search algorithm on a graph from given source node
  Time complexity: O(V + E)
  Space complexity: O(V)
  """
  r = BFSResult.new
  q = Queue.new
  r.parent = {source: nil}
  r.level = {source: 0}
  q.enq(source)
  until q.empty?
    node = q.deq
    graph.adj[node].each do |n|
      unless r.level[n]
        r.parent[n] = node
        r.level[n] = r.level[node] + 1
        q.enq(n)
      end
    end
  end
  r
end
