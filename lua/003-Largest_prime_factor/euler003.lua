number = 600851475143

while 0 == (number % 2) and number > 1
do
	number = number / 2
end
divisor = 3
while number > 1
do
	if 0 == number % divisor then
		number = number / divisor
	else
		divisor = divisor + 2
	end
end

print(divisor)