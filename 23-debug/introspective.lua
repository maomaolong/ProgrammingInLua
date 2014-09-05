

--[[
local function func()
	print("Hello world")
end
for k,v in pairs(debug.getinfo(func)) do 
	print(k,v)
end
--]]

