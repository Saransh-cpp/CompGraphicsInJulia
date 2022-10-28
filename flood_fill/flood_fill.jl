# Python3 program to implement
# flood fill algorithm

# Dimensions of paint screen
M = 8
N = 8

function _ff_util(screen, x, y, prevC, newC)
	
	# Base cases
	if x < 0 || x >= M || y < 0 || y >= N || screen[x][y] != prevC || screen[x][y] == newC
		return
    end

	screen[x][y] = newC

	_ff_util(screen, x + 1, y, prevC, newC)
	_ff_util(screen, x - 1, y, prevC, newC)
	_ff_util(screen, x, y + 1, prevC, newC)
	_ff_util(screen, x, y - 1, prevC, newC)
end

function flood_fill(screen, x, y, newC)
	prevC = screen[x][y]
	if prevC==newC 
        return
    end
	_ff_util(screen, x, y, prevC, newC)
end


function main()
    screen = [[1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 0, 0],
            [1, 0, 0, 1, 1, 0, 1, 1],
            [1, 2, 2, 2, 2, 0, 1, 0],
            [1, 1, 1, 2, 2, 0, 1, 0],
            [1, 1, 1, 2, 2, 2, 2, 0],
            [1, 1, 1, 1, 1, 2, 1, 1],
            [1, 1, 1, 1, 1, 2, 2, 1]]

    x = 4
    y = 4
    newC = 3
    flood_fill(screen, x, y, newC)

    for i in 1:M
        for j in 1:N
            print(screen[i][j], ' ')
        end
        print('\n')
    end
end
