
function readOnly(t)
	local proxy = {}
	local mt = {
		__index = t,
		__newindex = function(tab,k,v)
			error("error this table is readonly!",1)
		end
	}
	setmetatable(proxy,mt)
	return proxy
end

local tab = {x = 8, y = 9,}

tab = readOnly(tab)

print(tab.x)

tab.y = 0

print(tab.y)
