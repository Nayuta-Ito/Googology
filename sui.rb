def v(x)
	num = 0
	while x%10==0 do
		num += 1
		x /= 10
	end
	return num
end

def quot(x)
	return x / (10 ** v(x))
end

def len(x)
	return x.to_s.length
end

def sui(x)
	#1.
	n0 = v(x)
	a0 = quot(x)
	#2.
	b0 = len(a0) - 1
	c0 = a0.to_s[0].to_i
	d0 = a0.to_s[1..-1].to_i
	#3.
	if d0 == 0 then
		#3.1.
		if n0 == 0 then
			return 0
		else
			puts "returns 10^#{x}"
			return 10**x
		end
	#4.
	elsif 0 < d0 && d0 < 10 then
		#4.1.
		n1 = v(b0)
		a1 = quot(b0)
		#4.2.
		if c0 == 9 then
		#4.3.
		else
		end
	#5.
	else
		#5.1.
		d0 = len(b1) - 1
		d1 = (10 ** (b0 - b1)) * c0 + 1
		#5.2.
		if d1 == 91 then
			#5.2.1.
			if n0 == 0 then
				return 1
			#5.2.2.
			elsif n0 == 1 then
				return d0
			#5.2.3.
			else
				puts "returns 10^#{x}*#{d0}"
				return (10 ** x) * d0
			end
		#5.3.
		else
			#5.3.1.
			y = sui((10 ** n0) * d1)
			#5.3.2.
			if n0 == 0 || y == 0 then
				return y
			#5.3.3.
			else
				#5.3.3.1.
				n1 = v(y)
				a1 = quot(y) / 10
				#5.3.3.2.
				a2 = d0 + (10 ** (b1+1)) * a1
				puts "returns 10^#{y}*#{a2}"
				return (10 ** y) * a2
			end
		end
	end
end

for i in 1..100 do
	p [i,sui(i)]
end