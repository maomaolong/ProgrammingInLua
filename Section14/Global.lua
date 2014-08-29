
---[[
--此处要注意declare必须在调用setmetatable(_G,mt)之前定义，因为lua中函数也是第一类值，所以declare也是全局变量

--target: only permit to use declare function to declare global variable

function declare(name,initval)
	rawset(_G,name,initval or false)
end

local mt = {
	__index = function(t,k)
		error("error attempt to read a Undefined variable " .. tostring(k))
	end
	,
	__newindex = function(t,k,v)
		error("error attempt to write a Undefined variable " .. tostring(k))
	end
}

setmetatable(_G,mt)
--print(a)
--a = 10

--declare (a,10) --error
declare ("a",10) --right
print(a)
--]]

--dofile("F:/chenglong/GitHub/ProgrammingInLua/Section14/GlobalEx.lua")