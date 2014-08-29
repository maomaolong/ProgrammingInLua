
--[[
以数字 n调用debug.getinfo(n)时，返回在n级栈的活动函数的信息数据。
比如，如果n=1，返回的是正在进行调用的那个函数的信息。
（n=0表示 C函数getinfo本身）如果n比栈中活动函数的个数大的话，
debug.getinfo返回nil。
参考：http://blog.csdn.net/kylin_p/article/details/5934964
--]]

--目标：只允许在主程序块中对全局变量进行赋值

local debugInfo = debug.getinfo(1,"S")

---[[
print("print short_src : " .. debugInfo.short_src)
for k,v in pairs(debugInfo) do
	print(tostring(k) .. " --> " .. tostring(v))
end
--]]
local what = debugInfo.what


---[[
local mt = {
	__index = function(t,k)
		error(string.format("error %s undeclare!",k))
	end
	,
	__newindex = function(t,k,v)
		local w = debug.getinfo(2,"S").what 
		if w ~= "main" and w ~= "C" then
			print("error")
			error(string.format("error %s undeclare!",k))
		end
		rawset(t,k,v)
		print("excute the rawset")
	end
}

setmetatable(_G,mt)
b = nil
--print(b) -- error , because if a global variable is nil then lua think it is undeclared
local c = nil
print(c)   --ok , c is not a global variable
a = 10  --ok
print(a)
local test = function()
	a = 10
	print(a)
end
--test()  --error
--]]

