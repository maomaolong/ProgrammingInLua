
function getField(f)
	local v = _G
	for w in string.gmatch(f,"[%w_]+") do 
		v = v[w]
	end
	return v
end

a = {}
a.b = {}
a.b.c = "hello"
print(getField("a.b.c"))