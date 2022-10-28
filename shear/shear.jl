function shear(pointsA, h, axis)
	
	pointsB = []
	
	if axis=='x'
		for (x,y) in pointsA
			xf = trunc(Int, (x+h*y))
			yf = y
			push!(pointsB, (xf,yf))
		end
	elseif axis=='y'
		for (x,y) in pointsA
			xf = x
			yf = trunc(Int, (y+h*x))
			push!(pointsB, (xf,yf))
		end
	end
	return pointsB
end

function main(pointsA = [(0,0), (0,100), (100,100), (100,0)], h=0.5)
	isClosed = true

	pointsB1 = shear(pointsA, h,'x')
	pointsB2 = shear(pointsA, h,'y')

	return pointsA, pointsB1, pointsB2, isClosed
end

# using Plots
# include("shear.jl")
# x, y, _ = main()
# Plots.plot(vec([y_[1] for y_ in x]), vec([x_[2] for x_ in x]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in y1]), vec([x_[2] for x_ in y]), seriestype=:scatter)
# Plots.plot!(vec([y_[1] for y_ in y2]), vec([x_[2] for x_ in y]), seriestype=:scatter)
