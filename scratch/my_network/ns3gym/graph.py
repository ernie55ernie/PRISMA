from queue import PriorityQueue

class Graph:
    def __init__(self, num_of_vertices, start_vertex):
        self.v = num_of_vertices
        self.edges = [[-1 for i in range(num_of_vertices)] for j in range(num_of_vertices)]
        self.visited = []
        self.D = None
        self.next_hop = None
        self.RoutingTable = None
        self.adjacency_matrix_file_name = 'adjacency_matrix.txt'
        self.start_vertex = start_vertex
        self.list_neighbors = []
    
    def openFile(self):
        f = open(self.adjacency_matrix_file_name, 'r')
        for (i,line) in enumerate(f):
            adj_vec = line.split()
            for (j,value) in enumerate(adj_vec):
                if(value=='1'):
                    #print(i, j)
                    self.add_edge(i,j,1)
                    if(j==self.start_vertex):
                        self.list_neighbors.append(i)
                    elif (i==self.start_vertex):
                        self.list_neighbors.append(j)
                    
        print(self.list_neighbors)
    def add_edge(self, u, v, weight):
        self.edges[u][v] = weight
        self.edges[v][u] = weight

    def dijkstra(self):
        self.D = {v:float('inf') for v in range(self.v)}
        self.next_hop = {v:float(self.start_vertex) for v in range(self.v)}
        self.RoutingTable = {v:float(-1) for v in range(self.v)}
        self.D[self.start_vertex] = 0

        pq = PriorityQueue()
        pq.put((0, self.start_vertex))

        while not pq.empty():
            (dist, current_vertex) = pq.get()
            self.visited.append(current_vertex)

            for neighbor in range(self.v):
                if self.edges[current_vertex][neighbor] != -1:
                    distance = self.edges[current_vertex][neighbor]
                    if neighbor not in self.visited:
                        old_cost = self.D[neighbor]
                        new_cost = self.D[current_vertex] + distance
                        if new_cost < old_cost:
                            pq.put((new_cost, neighbor))
                            self.D[neighbor] = new_cost
                            if(current_vertex==self.start_vertex):
                                self.next_hop[neighbor] = neighbor
                            else:
                                self.next_hop[neighbor] = self.next_hop[current_vertex]
        return self.D
    
    def getInterface(self, dest):
        if(dest!=self.start_vertex):
            return self.list_neighbors.index(self.next_hop[dest])
        else:
            return -1
        #for i in range(self.v):
        #    count=0
        #    for j in range(self.v):
        #        if(j==self.next_hop[i]):
        #            break
        #        if(i==j):
        #            continue
        #        if(self.edges[self.start_vertex][j]==1):
        #            count += 1
        #    if(self.start_vertex==self.next_hop[i]):
        #        self.RoutingTable[i] = -1
        #    else:
        #        self.RoutingTable[i] = count