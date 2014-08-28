
local Window = {}
Window.mt = {}
Window.prototype = {x = 0, y = 0, width = 100, height = 80,}

function Window.new(o)
	setmetatable(o,Window.mt)
	return o
end

--Window.mt.__index = function(table,k)
--	return Window.prototype[k]
--end
Window.mt.__index = Window.prototype

local obj = Window.new{x = 10,y = 89,}
print(obj['width'])
print(obj.width)
print(rawget(obj,'width'))
print(rawget(obj,'x'))

-------------------------------------------------------------------------



