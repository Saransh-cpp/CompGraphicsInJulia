"""
Experiment:

How well does Julia's JIT compilation using LLVM performs against vanilla Python?

Results:

Pure pythonic (and raw) implementation - 2.1159651279449463 s
Pure julian (and optimised) implementation - 0.114781 s

JIT compilation of Julia with optimisations (typed, memory efficient, etc., etc.)
is 18.5 times (18.4348030418 precisely) times faster than pure Pythonic implementation.

See below for Pythonic and Julian implementations
"""
function bh_algo(point₁::NTuple{2, Union{Float64, Int64}}, point₂::NTuple{2, Union{Float64, Int64}})
    x₁::Float64 = point₁[1]
    y₁::Float64 = point₁[2]
    x₂::Float64 = point₂[1]
    y₂:: Float64 = point₂[2]

    Δx::Int64 = abs(x₂ - x₁)
    Δy::Int64 = abs(y₂ - y₁)
    m::Float64 = Δy/Float64(Δx)

    x, y = x₁, y₁
    x_coords = Vector{Union{Int64, Float64}}(undef, Δx-1)
    y_coords = Vector{Union{Int64, Float64}}(undef, Δx-1)

    if m > 1
        Δx, Δy = Δy, Δx
        x, y = y, x
        x₁, y₁ = y₁, x₁
        x₂, y₂ = y₂, x₂
    end

    p = 2Δy - Δx

    for k = 1:Δx-1
        if p > 0
            y = ifelse(y < y₂, y + 1, y - 1)
            p = p + 2(Δy - Δx)
        else
            p = p + 2Δy
        end
        x = ifelse(x < x₂, x + 1, x - 1)
        x_coords[k] = x
        y_coords[k] = y
    end

    x_coords, y_coords
end

# Run in Julia REPL
#=
include("./bh.jl")
using Plots


x, y = bh_algo((0., 0.), (4, 4))

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
plot!(
    x,
    y,
    lw = 2,
    label = ""
)
=#

# Pure pythonic implementation (taken from google)
#=
import time


def bh_algo(x1, y1, x2, y2):
    t_init = time.time()
    dx = abs(x2 - x1)
    dy = abs(y2 - y1)
    slope = dy/float(dx)
    x_list, y_list = [], []
    x, y = x1, y1
    if slope > 1:
        dx, dy = dy, dx
        x, y = y, x
        x1, y1 = y1, x1
        x2, y2 = y2, x2
    p = 2 * dy - dx
    for k in range(2, dx):
        if p > 0:
            y = y + 1 if y < y2 else y - 1
            p = p + 2*(dy - dx)
        else:
            p = p + 2*dy
        x = x + 1 if x < x2 else x - 1
        x_list.append(x)
        y_list.append(y)
    t_f = time.time()
    return x_list, y_list, t_f - t_init
=#
