load './Shortest Paths/dijkstra.rb'
load './Shortest Paths/bellman_ford.rb'
load './Shortest Paths/shortest_path_node.rb'
load './../../Data Structures/Graphs/graph.rb'

G = Graph.new(true)

A = ShortestPathNode.new('A')
B = ShortestPathNode.new('B')
C = ShortestPathNode.new('C')
D = ShortestPathNode.new('D')
E = ShortestPathNode.new('E')

G.add_edge(A, B, 4)
G.add_edge(A, C, 1)
G.add_edge(B, C, 1)
G.add_edge(B, D, 3)
G.add_edge(B, E, 5)
G.add_edge(C, D, 1)
G.add_edge(D, E, 2)

bellman_ford(G, A)
