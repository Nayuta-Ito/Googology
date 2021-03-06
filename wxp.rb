#s[n]+vを展開する
#Rubyでは配列の添え字は1からなので全てが1個ずれる

s = [[0,0], [1,2], [2,0], [1,1], [2,3], [3,0], [2,2], [3,4], [4,0], [3,4]]
n = 5

k = s.length

if s == [[0,0]] then #rule1
	s = []
elsif s[-1] == [0,0] then #rule2
	s.pop
	n += 1
else
	if s[k-1][1] == 0 then #rule3
		m = k
		while !(s[m-1][0] < s[k-1][0]) do
			m -= 1
		end
		
		g = s[0..(m-1)-1]
		b = s[(m-1)..(k-1)-1]
		s.pop
		(n-1).times do #sには最初からbが1個ある
			s.concat(b)
		end
	else #rule4
		a = [k]
		p = k
		while p-1 >= 0 do
			if s[p-1][0] < s[a[-1]-1][0] then
				a.push(p)
			end
			p -= 1
		end
		
		m = k
		while m >= 1 do
			if a.index(m) && s[m-1][1] < s[k-1][1] then
				break
			end
			m -= 1
		end
		
		
		delta1 = s[k-1][0] - s[m-1][0]
		delta2 = s[k-1][1] - s[m-1][1] - 1
		
		s.pop
		
		g = []
		if (m-1)-1 > 0 then
			g = s[0..(m-1)-1]
		end
		for i in 0..(n-1) do
			bi = []
			for j in m..(k-1) do
				bi.push([s[j-1][0] + i * delta1, s[j-1][1] + i * delta2])
			end
			g.concat(bi)
		end
		
		for i in 0...g.length do
			s[i] = g[i].clone
		end
	end
end

#結果を表示
puts "#{s.inspect}[#{n}]"