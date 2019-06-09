#s[n]+vを展開する
#Rubyでは配列の添え字は1からなので全てが1個ずれる
#配列t_ary(原文ではT)は0オリジンなのでずれない

class Array
	def deep_copy
		b = []
		self.each do |elem|
			if elem.is_a?(Array) then
				b.push(elem.deep_copy)
			else
				b.push(elem)
			end
		end
		return b
	end
end

s = [[0,0], [1,1], [1,0]]
n = 5

k = s.length

if s == [[0,0]] then #rule1
	s = []
elsif s[-1] == [0,0] then #rule2
	s.pop
	n += 1
else
	t_ary = [k]
	m = k
	while m >= 0 do
		if m < t_ary[-1] && s[m-1][0] < s[t_ary[-1]-1][0] then
			t_ary.push(m)
		end
		m -= 1
	end

	#puts "t_ary: #{t_ary.inspect}"

	r = 0
	t_num = k - 1
	while t_num >= 0 do
		if t_ary.index(t_num) && (s[t_num-1][1] < s[-1][1] || s[-1][1] == 0) then
			r = t_num
			break
		end
		t_num -= 1
	end

	g = []
	if (r-1)-1 >= 0 then
		g = s[0..(r-1)-1]
	end
	b = s[r-1...-1]

	#puts "g: #{g.inspect}"
	#puts "b: #{b.inspect}"

	if s[k-1][0] > 0 && s[k-1][1] == 0 then #rule3
		#puts "entered rule3"
		s.pop
		(n-1).times do #sには最初からbが1個ある
			s.concat(b)
		end
	else #rule4
		"puts entered rule4"
		delta = s[k-1][0] - s[r-1][0]
		p = delta

		for i in 1..n do
			for t_idx in (1..p).to_a.reverse do
				#p(["t_idx:", t_idx])
				#(a_T_(t_idx)+iΔ, b_T_(t_idx)) concat A_(t_idx)(i)
				b.push([s[t_ary[t_idx] - 1][0] + i * delta, s[t_ary[t_idx] - 1][1]])
				ati = Array.new()
				for j in t_ary[t_idx]..t_ary[t_idx-1]-2 do
					if t_idx == 1 then
						ati.push([s[j][0] + i * delta, s[j][1]])
					end
				end
				b.concat(ati.deep_copy)
				#puts "ati: #{ati.inspect}"
				#puts "b: #{b.inspect}"
			end
		end

		s = g.deep_copy
		s.concat(b)
	end
end

#結果を表示
puts "#{s.inspect}[#{n}]"
