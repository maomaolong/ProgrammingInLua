
--[[
function setDefault(t,d)
	local mt = {__index = function() return d end}
	setmetatable(t,mt)
end

local tab = {x = 10 , y = 90,}
setDefault(tab,0)
print(tab['hello'])
--]]



---------------------------------------------------------------------------
--every table use the same metatable
---------------------------------------------------------------------------
--[[
local mt = {__index = function(t) return t.___ end}
function setDefault(t,d)
	t.___ = d
	setmetatable(t,mt)
end

local tab = {x = 10 , y = 90,}
setDefault(tab,0)
print(tab['hello'])
--]]



---------------------------------------------------------------------------
--guarantee uniqueness key
---------------------------------------------------------------------------
---[[
local key = {}
local mt = {__index = function(t) return t[key] end}
function setDefault(t,d)
	t[key] = d
	setmetatable(t,mt)
end

local tab = {x = 10 , y = 90,}
setDefault(tab,0)
print(tab['hello'])
--]]




