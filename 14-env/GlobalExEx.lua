
--garget: use a table to save declared global variable to resolve GlobalEx.lua's can't use declared b = nil problem 

local declaredNames = {}

local mt = {
	__index = function(t,k)
		if not declaredNames[k] then
			error(string.format("read error: key %s is not declared",tostring(k)))
		end
	end
	,
	__newindex = function(t,k,v)
		if not declaredNames[k] then 
			local w = debug.getinfo(2,"S").what
			if w ~= "main" and w ~= "C" then 
				error(string.format("write error: key %s is not declared",tostring(k)))
			end
			rawset(t,k,v)
			declaredNames[k] = true
		end
	end
}

setmetatable(_G,mt)

b = nil 
print(b)