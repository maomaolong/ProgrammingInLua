

--[[
local function func()
	print("Hello world")
end
for k,v in pairs(debug.getinfo(func)) do 
	print(k,v)
end
--]]

--[[
function traceback() 
	for level = 1 ,math.huge do
		local info = debug.getinfo(level,"Sl")
		if not info then 
			break
		end
		if info.what == "C" then 
			print("It's a C FUNCTION")
		else
			print(string.format("leave = %d [%s]:%d",level,info.short_src,info.currentline))
		end
	end
end
traceback() 
--]]

--debug.traceback()

--[[
function foo(a,b)
	local x 
	do
		local c = a - b
	end
	local a = 1
	while true do
		local name,value = debug.getlocal(1,a)
		if not name then 
			break
		end
		print(name,value)
		a = a + 1
	end
end
foo(10,20)
--]]


--[[
function getvarvalue(name)
	local value,found
	
	--尝试局部变量
	for i = 1,math.huge do 
		local n,v = debug.getlocal(2,i)
		if not n then 
			break
		end
		if n == name then 
			value = v
			found = true
		end
	end
	if found then return value end
	
	--尝试非局部变量
	local fun = debug.getinfo(2,"f").func
	for i = 1,math.huge do 
		local n,v = debug.getupvalue(fun,i)
		if not n then 
			break
		end
		if n == name then 
			return v
		end
	end
	
	--还没找到，访问环境
	return getfenv(fun)[name]	
end

function fun() 
	local a = 19
	local v = getvarvalue("a")
	print(v)
end
fun()
--]]


local co = coroutine.create(
	function()
		local x = 10
		coroutine.yield()
		error("this is a error")
	end
)

coroutine.resume(co)
print(debug.traceback(co))
coroutine.resume(co)
print(debug.traceback(co))
















