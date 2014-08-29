
local localEnv = function()
	local evn = {}
	setmetatable(evn,{__index = _G})
	a = 1
	setfenv(1,evn)
	a = 10 
	print(_G.a)
	print(a)
end
localEnv()
print(a)


function factory()
	return function()
		return a
	end
end

f1 = factory()
f2 = factory()
a = 3
print(f1())
print(f2())

setfenv(f1,{a = 100})

print(f1())
print(f2())