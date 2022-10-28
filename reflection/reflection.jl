function _reflect(pointsA, axis)
	
	pointsB = []
	
	if axis=='x'
		for (x,y) in pointsA
			xf = x
			yf = -y
			push!(pointsB, (xf,yf))
		end
	elseif axis=='y'
		for (x,y) in pointsA
			xf = -x
			yf = y
			push!(pointsB, (xf,yf))
		end
	elseif axis=='o'
		for (x,y) in pointsA
			xf = -x
			yf = -y
			push!(pointsB, (xf,yf))
		end
	end

	return pointsB
end


function main()
	
	pointsA = [(50,50), (100,100)]
	isClosed = true

	pointsB1 = _reflect(pointsA, 'x')
	pointsB2 = _reflect(pointsA, 'y')
	pointsB3 = _reflect(pointsA, 'o')

	return pointsA, pointsB1, pointsB2, pointsB3, isClosed
end


# using Plots
# include("reflect.jl")
# x, y, z, o, _ = main()
# Plots.plot(vec([y_[1] for y_ in x]), vec([x_[2] for x_ in x]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in y]), vec([x_[2] for x_ in y]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in z]), vec([x_[2] for x_ in z]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in o]), vec([x_[2] for x_ in o]), seriestype=:scatter)
