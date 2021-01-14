## R Library for graph coloring

Graph coloring problem is to assign colors to certain elements of a graph subject to certain constraints. Vertex coloring is the most common graph coloring problem. The problem is, given m colors, find a way of coloring the vertices of a graph such that no two adjacent vertices are colored using same color.
graphcoring is a small R library solves this problem for toronto dataset and for any other dataset of this form.

## Design goals:

- Adjacency matrix.
- Vertices conflict density.
- Degree of vertices.
- Coefficient of variation.
- Statistics matrix.
- Color vertices with prefered algorithm.

## Supported Keras layers:
- [x] FirstFit
- [x] Dsatur 
- [ ] RLF
- [ ] Backtracking Dsatur
