require_relative './dfs_result.rb'

def dfs(graph)
  r = DFSResult.new
  r.parent = {s: nil}
  graph.adj.each {|n| r.parent[n] = nil}
  graph.adj.each do |n|
    dfs_visit(graph, n, r) unless r.start[n]
  end
  r
end

def dfs_visit(g, u, r)
  r.start[u] = r.time
  r.time += 1
  r.edges[(r.parent[u], u] = "tree" if r.parent[u]

  g.adj[u].each do |v|
    if !r.start[v]
      r.parent[v] = u
      dfs_visit(g,v,r)
    elsif !r.finish[v]
      r.edges[(u,v)] = "back"
    elsif r.finish[v] > r.start[u]
      r.edges[(u,v)] = "forward"
    else
      r.edges[(u,v)] = "cross"
    end
  end
  r.finish[n] = r.time
  r.order << u
end
