require './dfs.rb'

def topological_sort(graph)
  result = dfs(graph);
  result.order.reverse
end
