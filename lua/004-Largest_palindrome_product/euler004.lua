result = -1

for x = 10, 100, 1
do
	for y = 10, 100, 1
	do
		num = x * y
		rev = 0
		while not num == 0
		do
			rem = num % 10
			rev = (rev * 10) + rem
			num = num / 10
		end
		num = x * y
		if num == rev and num > result then
			result = num
			break
		end
	end
end

print(result)