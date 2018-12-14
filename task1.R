library(igraph)

# Task 1
g.c <- c()
g.l <- c()

graph <- watts.strogatz.game(1, 1000, 4, 0)
C <- transitivity(graph)
L <- average.path.length(graph)

g.c <- c(1)
g.l <- c(1)

seqq <- c(0.0001, 0.0002, 0.0004, 0.0008, 0.001, 0.002, 0.004, 
          0.008, 0.01, 0.02, 0.04, 0.08, 0.1, 0.2, 0.4, 0.8, 1)
for(P in seqq)
{
  ?watts.strogatz.game
  graph <- watts.strogatz.game(1, 1000, 4, P)
  g.c <- c(g.c, transitivity(graph)/C)
  g.l <- c(g.l, average.path.length(graph)/L)
}

P <- c(0, seqq)
plot(P,g.c, pch=0, log="x", ylab="Values")
axis(side=1, at=P)
points(P,g.l, pch=16)