function scale(pointsA, sx, sy, xp, yp)
	pointsB = []
	for (x,y) in pointsA
		xf = trunc(Int, (x-xp)*sx) + xp
		yf = trunc(Int, (y-yp)*sy) + yp
		push!(pointsB, (xf,yf))
	end
	return pointsB
end


function main(pointsA = [(50,50), (100,50), (100,100), (50,100)], sx = 2.0, sy = 2.0, xp = 75, yp = 75)
	isClosed = true

	pointsB = scale(pointsA, sx, sy, xp, yp)
	return pointsA, pointsB, isClosed
end

# using Plots
# include("scale.jl")
# x, y, _ = main()
# Plots.plot(vec([y_[1] for y_ in x]), vec([x_[2] for x_ in x]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in y]), vec([x_[2] for x_ in y]), seriestype=:scatter)
