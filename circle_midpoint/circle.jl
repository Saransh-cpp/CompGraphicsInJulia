function circle_algo(centre::NTuple{2, Union{Float64, Int64}}, r::Union{Float64, Int64})
    x_center::Float64 = centre[1]
    y_center::Float64 = centre[2]

    x_quad1 = Vector{Union{Int64, Float64}}()
    y_quad1 = Vector{Union{Int64, Float64}}()

    x_init = 0
    y_init = r
    
    p = 1 - r
        
    x = x_init
    y = y_init

    while x < y
        append!(x_quad1, x)
        append!(y_quad1, y)
        
        if p < 0
            x += 1
            p += 1 + 2x
        else
            x += 1
            y -= 1
            p += 1 - 2y + 2x
        end
    end

    append!(x_quad1, x)
    append!(y_quad1, y)

    for i = 1:length(x_quad1)
        append!(x_quad1, y_quad1[i])
        append!(y_quad1, x_quad1[i])
    end

    x_quad2 = [(x_center - x) for x in x_quad1]
    y_quad2 = [(y_center + y) for y in y_quad1]

    x_quad3 = [(x_center - x) for x in x_quad1]
    y_quad3 = [(y_center - y) for y in y_quad1]

    x_quad4 = [(x_center + x) for x in x_quad1]
    y_quad4 = [(y_center - y) for y in y_quad1]

    x_quad1 = [(x_center + x) for x in x_quad1]
    y_quad1 = [(y_center + y) for y in y_quad1]

    x_quad1, y_quad1, x_quad2, y_quad2, x_quad3, y_quad3, x_quad4, y_quad4

end

# Run in Julia REPL
#=
include("./circle.jl")
using Plots


x_quad1, y_quad1, x_quad2, y_quad2, x_quad3, y_quad3, x_quad4, y_quad4 = circle_algo((0, 0), 10.)

plot(
    [x_quad1, x_quad2, x_quad3, x_quad4],
    [y_quad1, y_quad2, y_quad3, y_quad4],
    seriestype = :scatter,
    title = "Midpoint circle drawing algorithm",
    xlabel = "x",
    ylabel= "y",
    label=""
)
=#
