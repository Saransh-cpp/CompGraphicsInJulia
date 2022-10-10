Execute the following to run the algorithm -

```julia
julia> include("./dda.jl")
dda_algo

julia> using Plots

julia> x, y = dda_algo((0., 0.), (50, 50))
(Union{Float64, Int64}[0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0  …  40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0], Union{Float64, Int64}[0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0  …  40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0])

julia> plot(
           x,
           y,
           lw = 3,
           seriestype = :scatter,
           label = "",
           title = "DDA Algorithm",
           xlabel = "x",
           ylabel= "y"
       )

julia> plot!(
           x,
           y,
           lw = 2,
           label=""
       )
```
