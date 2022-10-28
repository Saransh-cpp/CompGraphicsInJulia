INSIDE = 0 # 0000
LEFT = 1 # 0001
RIGHT = 2 # 0010
BOTTOM = 4 # 0100
TOP = 8	 # 1000

x_max = 10.0
y_max = 8.0
x_min = 4.0
y_min = 4.0


function _compute_code(x::Union{Int64, Float64}, y::Union{Int64, Float64})
	code = INSIDE
	if x < x_min
		code |= LEFT
	elseif x > x_max
		code |= RIGHT
    end
	if y < y_min
		code |= BOTTOM
	elseif y > y_max
		code |= TOP
    end

	return code
end


function cs_clip_it(x1::Union{Int64, Float64}, y1::Union{Int64, Float64}, x2::Union{Int64, Float64}, y2::Union{Int64, Float64})

	code1 = _compute_code(x1, y1)
	code2 = _compute_code(x2, y2)
	accept = false

	while true

		if code1 == 0 && code2 == 0
			accept = true
			break
		elseif (code1 & code2) != 0
			break
		else
			x = 1.0
			y = 1.0
			if code1 != 0
				code_out = code1
			else
				code_out = code2
            end

			if code_out & TOP != 0
				x = x1 + (x2 - x1) * (y_max - y1) / (y2 - y1)
				y = y_max
			elseif code_out & BOTTOM != 0
				x = x1 + (x2 - x1) * (y_min - y1) / (y2 - y1)
				y = y_min
			elseif code_out & RIGHT != 0
				y = y1 + (y2 - y1) * (x_max - x1) / (x2 - x1)
				x = x_max
			elseif code_out & LEFT != 0
				y = y1 + (y2 - y1) * (x_min - x1) / (x2 - x1)
				x = x_min
            end

			if code_out == code1
				x1 = x
				y1 = y
				code1 = _compute_code(x1, y1)

			else
				x2 = x
				y2 = y
				code2 = _compute_code(x2, y2)
            end
        end
    end

	if accept
		print("Line accepted - $x1, $y1, $x2, $y2")

	else
		print("Line rejected")
    end
end


# cs_clip_it(5, 5, 7, 7)
# cs_clip_it(7, 9, 11, 4)
# cs_clip_it(1, 5, 4, 1)
