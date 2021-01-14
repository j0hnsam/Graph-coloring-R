## R Library for graph coloring

Graph coloring problem is to assign colors to certain elements of a graph subject to certain constraints. Vertex coloring is the most common graph coloring problem. The problem is, given m colors, find a way of coloring the vertices of a graph such that no two adjacent vertices are colored using same color.
graphcoring is a small R library solves this problem for toronto dataset and for any other dataset of this form.

## Design goals:

- Adjacency matrix.
- Vertices conflict density.
- Degree of vertices.
- Coefficient of variation.
- Statistics matrix.
- Numeric coloring vertices with prefered algorithm.
- Coloring validation.

## Supported algorithms:
- [x] FirstFit
- [x] Dsatur 
- [ ] RLF
- [ ] Backtracking Dsatur

# Example

example.r:

```r

library(graphcoloring)
#x=import("toronto/hec-s-92.stu","") #loads dataset from file with prefered seperation
x=data.frame(hec_s_92) #loads dataset from library
distinct=distinct(x) #distinct verticies
AdjMatrix=AdjMatrix(x) #Adjacency matrix
Degrees=degrees(x)
coef_variation=coef_variation(x)
conf_density=conf_density(x)
statistics=stats(x)
FirstFit=FirstFit(x)
Dsatur=Dsatur(x)
validation_FirstFit=check_algo(FirstFit) #true means no color collisions false means color collisions
validation_Dsatur=check_algo(Dsatur) #true means no color collisions false means color collisions
#solve_toronto() #use it to color all toronto datasets with all algorithms

```
