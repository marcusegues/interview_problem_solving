load './dijkstra.rb'
load './../../Data Structures/Graphs/graph.rb'

G = Graph.new(true)

A = GraphNode.new('A')
B = GraphNode.new('B')
C = GraphNode.new('C')
D = GraphNode.new('D')
E = GraphNode.new('E')

G.add_edge(A, B, 4)
G.add_edge(A, C, 1)
G.add_edge(B, C, 1)
G.add_edge(B, D, 3)
G.add_edge(B, E, 5)
G.add_edge(C, D, 1)
G.add_edge(D, E, 2)

dijkstra(G, A)
