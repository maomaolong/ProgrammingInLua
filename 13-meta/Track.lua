
--[[
local t = {x = 10,y = 3,}
local _t = t
t = {}

local mt = {}

mt.__index = function(t,k)
	print("access key:" .. tostring(k))
	return _t[k]
end

mt.__newindex = function(t,k,v)
	print("update " .. tostring(k) .. " to " .. " value " .. tostring(v))
	_t[k] = v
end

setmetatable(t,mt)

print(t.x)
t.x = 3
for k,v in pairs(t) do
	print(tostring(k) .. " --> " .. tostring(v))
end
--]]



---------------------------------------------------

---------------------------------------------------
---[[
local index = {}

local mt = {
	__index = function(t,k)
		print("access key:" .. tostring(k))
		return t[index][k]
	end
	,
	__newindex = function(t,k,v)
		print("update " .. tostring(k) .. " to " .. " value " .. tostring(v))
		t[index][k] = v
	end
}

function track(t)
	local proxy = {}
	proxy[index] = t
	setmetatable(proxy,mt)
	return proxy
end

local tab = {x = 10,y = 3}

tab = track(tab)

print(tab.x)
tab.y = 89

for k,v in pairs(tab) do
	print(tostring(k) .. " --> " .. tostring(v))
end
--]]