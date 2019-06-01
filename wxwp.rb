#s[n]+vを展開する
#Rubyでは配列の添え字は1からなので全てが1個ずれる

s = [[0,0], [100,0]]
n = 5
v = 0

k = s.length

if s == [[0,0]] then #rule1
	s = []
elsif s[-1] == [0,0] then #rule2
	s.pop
	n += 1
	v += 1
else
	m = k
	while !(s[m-1][0] < s[k-1][0]) do
		m -= 1
	end
	
	if s[k-1][0] - s[m-1][0] == 1 && s[k-1][1] == 0 then #rule3
		g = s[0..(m-1)-1]
		b = s[(m-1)..(k-1)-1]
		s.pop
		(n-1).times do #sには最初からbが1個ある
			s.concat(b)
		end
	elsif s[k-1][1] > 0 then #rule4
		delta = s[k-1][0] - s[m-1][0]
		g = s[0..(m-1)-1]
		b = s[(m-1)..(k-1)-1]
		b_k1 = s[-1][1]
		s.pop
		n.times do |r| #こっちはbが合計n+1個ある
			br = []
			b.each do |a, b|
				br.push([a+(r+1)*delta, b])
			end
			br[0][1] = b_k1 - 1
			s.concat(br)
		end
	else #rule5
		s[-1] = [s[-1][0]-1, n]
	end
end

#結果を表示
puts "#{s.inspect}[#{n}]+#{v}"