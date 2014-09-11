
--[[
debug.sethook(print,"l")
local a = 2
local b = 0
print("a = %d",a)
--]]


function trace(event,line)
	local s = debug.getinfo(2).short_src
	print(event)
	print(s .. " : " .. line)
end
local b = 3
debug.sethook(trace,"l")