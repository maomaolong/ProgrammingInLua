
function setField(f,v)
	local t = _G
	for w,d in string.gmatch(f,"([%w_]+)(%.?)") do 
		if d == '.' then 
			t[w] = t[w] or {}
			t = t[w]
		else
			t[w] = v
		end
	end
end

setField("a.b.c",10)
print(a.b.c)