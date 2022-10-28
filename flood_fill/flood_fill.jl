layout = split(raw"""
            _____
           /     \\
          /       \\
    ,----(         )----.
   /      \\       /      \\
  /        \\_____/        \\
  \\        /     \\        /
   \\      /       \\      /
    )----(         )----(
   /      \\       /      \\
  /        \\_____/        \\
  \\        /     \\        /
   \\      /       \\      /
    `----(         )----'
          \\       /
           \\_____/
    """, '\n')

# print(layout)

# bounding chars of the hexagon
bound_chars = ['\\', '/', '\'', '_', '-', '.', ',', '`', '(', ')']

# points within each of the hexagon
points = [
    (4, 14),
    (6, 6),
    (6, 22),
    (9, 14),
    (11, 6),
    (11, 22),
    (14, 14),
]


function print_it()
    print("\n".join(["".join(row) for row in layout]))
end


function _flood(x, y)
    # check for the bounds
    if x >= len(layout) || x < 0 || y < 0 || y >= length(layout[x])
        return
    end

    # check for the bounds within each hexagon
    if layout[x][y] in bound_chars
        return
    end

    # check if already filled
    if layout[x][y] == '#'
        return
    end

    # fix the position
    layout[x][y] = '#'

    # render the layout
    print_it()

    _flood(x + 1, y)
    _flood(x - 1, y)
    _flood(x, y + 1)
    _flood(x, y - 1)


function flood(x, y)
    _flood(x, y)
end


# randomly shuffle the points
# random.shuffle(points)

# do flood fill for each hexagon
for X, Y in points
    flood(X, Y)
end
