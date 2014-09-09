

--[[
local co = coroutine.create(function() print("hei") end)
print(type(co))
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
--]]


--[[
local co = coroutine.create(function() 
		for i = 1,5 do
			print(i)
			coroutine.yield()
		end
	end)

coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print(coroutine.status(co))
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print(coroutine.status(co))
--]]


--[[
local co = coroutine.create(function(a,b,c) 
		print("co ",a,b,c)
	end)
coroutine.resume(co,1,2,3)
--]]



--[[
local co = coroutine.create(function(a,b) 
		coroutine.yield(a+b,a-b)
	end)
print(coroutine.resume(co,10,20))
print(coroutine.status(co))
print(coroutine.resume(co))
print(coroutine.status(co))
--]]


--[[
local co = coroutine.create(function() 
		print("co",coroutine.yield())
	end)
coroutine.resume(co)
coroutine.resume(co,1,2)
--]]


--[[
local co = coroutine.create(function()
	return 2,3
	end)
print(coroutine.resume(co))
--]]









