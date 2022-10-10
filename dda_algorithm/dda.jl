"""
Experiment:

How well does Julia's JIT compilation using LLVM performs against vanilla Python?

Results:

Pure pythonic (and raw) implementation - 1.5441396236419678 s
Pure julian (and optimised) implementation - 0.072925 s

JIT compilation of Julia with optimisations (typed, memory efficient, etc., etc.)
is 21 times (21.1743520554 precisely) times faster than pure Pythonic implementation.

See below for Pythonic and Julian implementations
"""
function dda_algo(point₁::NTuple{2, Union{Float64, Int64}}, point₂::NTuple{2, Union{Float64, Int64}})

    x₁::Float64 = point₁[1]
    y₁::Float64 = point₁[2]
    x₂::Float64 = point₂[1]
    y₂:: Float64 = point₂[2]

    Δx::Int64 = abs(x₂ - x₁)
    Δy::Int64 = abs(y₂ - y₁)

    steps::Int64 = max(Δx, Δy)

    δx::Float64 = Δx / steps
    δy::Float64 = Δy / steps

    x, y = x₁, y₁

    x_coords = Vector{Union{Int64, Float64}}(undef, steps)
    y_coords = Vector{Union{Int64, Float64}}(undef, steps)

    for i = 1:steps
        x_coords[i] = x
        y_coords[i] = y

        x += δx
        y += δy
    end
    
    x_coords, y_coords
end

#=
include("./dda.jl")
using Plots


x, y = dda_algo((0., 0.), (4, 4))

plot(
    x,
    y,
    lw = 3,
    seriestype = :scatter,
    label = "",
    title = "DDA Algorithm",
    xlabel = "x",
    ylabel= "y"
)
plot!(
    x,
    y,
    lw = 2,
    label=""
)
=#

# Pure pythonic implementation (taken from google)
#=
import time


def DDA(x0, y0, x1, y1):
    t_i = time.time()
    # find absolute differences
    dx = abs(x0 - x1)
    dy = abs(y0 - y1)
    # find maximum difference
    steps = max(dx, dy)
    # calculate the increment in x and y
    xinc  = dx/steps
    yinc = dy/steps
    # start with 1st point
    x = float(x0)
    y = float(y0)
    # make a list for coordinates
    x_coorinates = []
    y_coorinates = []
    for i in range(steps):
        # append the x,y coordinates in respective list
        x_coorinates.append(x)
        y_coorinates.append(y)
        # increment the values
        x = x + xinc
        y = y + yinc
    t_f = time.time()
    return x_coorinates, y_coorinates, t_f - t_i
=#
