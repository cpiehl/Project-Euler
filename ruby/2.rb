#!/usr/bin/ruby

sum = 0
n = 1
lastn = 0
while n < 4000000 do
	newn = n + lastn
	if newn % 2 == 0 then
		sum += newn
	end
	lastn = n
	n = newn
end

puts(sum)