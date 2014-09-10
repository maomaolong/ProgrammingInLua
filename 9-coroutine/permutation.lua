

--用协同来实现迭代器

--[=[
function permgen(a,n)
	n = n or #a
	if n<=1 then 
		printResult(a)
	else
		for i = 1,n do 
			a[n],a[i] = a[i],a[n]
			permgen(a,n-1)
			a[n],a[i] = a[i],a[n]
		end
	end
end

function printResult(a)
	---[[
	local str = ""
	for i = 1,#a do
		str = string.format("%s %s",str,a[i])
	end
	print(str)
	--]]
	--[[ 
	for i = 1,#a do
		io.write(a[i]," ")
	end
	print("\n")
	--]]
end

permgen({1,2,3,})
--]=]

---[=[
function permgen(a,n)
	n = n or #a
	if n<=1 then 
		coroutine.yield(a)
	else
		for i = 1,n do 
			a[n],a[i] = a[i],a[n]
			permgen(a,n-1)
			a[n],a[i] = a[i],a[n]
		end
	end
end

function permutations(a)
	local co = coroutine.create(
		function()
			permgen(a)
		end
	)
	return function()
		local code,res = coroutine.resume(co)
		return res
	end
end

function printResult(a)
	---[[
	local str = ""
	for i = 1,#a do
		str = string.format("%s %s",str,a[i])
	end
	print(str)
	--]]
	--[[ 
	for i = 1,#a do
		io.write(a[i]," ")
	end
	print("\n")
	--]]
end

for p in permutations({1,2,3}) do
	printResult(p)
end

--]=]




