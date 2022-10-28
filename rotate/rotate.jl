function _rotate(pointsA, t, xp, yp)
	
	t = t * π /180
	
	pointsB = []
	for (x,y) in pointsA
		xf = trunc(Int, (x-xp)*cos(t)-(y-yp)*sin(t)) + xp
		yf = trunc(Int, (x-xp)*sin(t)+(y-yp)*cos(t)) + yp
		push!(pointsB, (xf,yf))
	end
	return pointsB
end

function main(t = 60, xp = 50, yp = 50)
	pointsA = [(50,50), (100,100), (150,100)]
	isClosed = true

	pointsB = _rotate(pointsA, t, xp, yp)
	print(pointsB)
	return pointsA, pointsB, isClosed
end


# using Plots
# include("rotate.jl")
# x, y, _ = main()
# Plots.plot(vec([y_[1] for y_ in x]), vec([x_[2] for x_ in x]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in y]), vec([x_[2] for x_ in y]), seriestype=:scatter)
