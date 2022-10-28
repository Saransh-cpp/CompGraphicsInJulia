function _translate(pointsA, tx, ty)
	pointsB = []
	for (x,y) in pointsA
		push!(pointsB, (x+tx,y+ty))
	end
	return pointsB
end

function main(pointsA = [(50,50), (100,100)], tx=50, ty=50)
	isClosed = true

	pointsB = _translate(pointsA, tx, ty)
	return pointsA, pointsB, isClosed
end


# using Plots
# include("translate.jl")
# x, y, _ = main()
# Plots.plot(vec([y_[1] for y_ in x]), vec([x_[2] for x_ in x]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in y]), vec([x_[2] for x_ in y]), seriestype=:scatter)
