function rectangle_bresenham(x₀::Float64, y₀::Float64, l::Float64, b::Float64)
    x₁ = x₀
    y₁ = y₀
    
    x₂ = x₁ + l
    y₂ = y₁

    x₃ = x₂ + b
    y₃ = y₂ + b

    x₄ = x₁
    y₄ = y₁ + b

    x_vals = []
    y_vals = []


    δx = abs(x₂ - x₁)
    δy = abs(y₂ - y₁)
    δT = 2 * abs(δx - δy)
    δS = 2 * δy
    δ = 2 * abs(δy)-abs(δx)
    print("Decision Parameter for line 1: ", δ, "\n")

    δx² = abs(x₃ - x₄)
    δy² = abs(y₃ - y₄)
    δT² = 2 * abs(δy² - δx²)
    δS² = 2 * δy²
    δ² = 2 * abs(δy²)-abs(δx²)
    print("Decision Parameter for line 2: ", δ², "\n")

    y = y₁
    x_l2 = x₁

    print("delta x: ", δx, "\n")
    print("delta y: ", δy, "\n")

    print("delta x3: ", δx², "\n")
    print("delta y3: ", δy², "\n")

    for x in x₁:x₂
        push!(x_vals, x)
        push!(y_vals, y)
        push!(x_vals, x)
        push!(y_vals, y + b)
        if δ >= 0
            y = y + 1
            δ = δ - δT
        else
            δ = δ + δS
        end
    end


    for y_ in y₁:y₄
        push!(x_vals, x_l2)
        push!(y_vals, y_)
        push!(x_vals, x_l2 + l)
        push!(y_vals, y_)
        if δ² >= 0
            x_l2 = x_l2 + 1
            δ² = δ² - δT²
        else
            δ² = δ² + δS²
        end
    end

    x_vals, y_vals
end


#=

include("./bh_rect.jl")
using Plots

x, y = rectangle_bresenham(0., 0., 2., 3.)

plot(
    x,
    y,
    lw = 3,
    seriestype = :scatter,
    label = "",
    title = "BH Algorithm",
    xlabel = "x",
    ylabel= "y"
)

=#
