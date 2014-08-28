
local Set = {}

local mt = {}
mt.__metatable = "not your business!"

function Set.new(t)
	local set = {}
	setmetatable(set,mt)
	for _,v in pairs(t) do
		set[v] = true
	end
	return set
end

function Set.union(a,b)
	local ret = Set.new{}
	for k in pairs(a) do
		ret[k] = true
	end
	for k in pairs(b) do
		ret[k] = true
	end
	return ret
end

function Set.intersection(a,b)
	local ret = Set.new{}
	for k in pairs(a) do
		ret[k] = b[k]
	end
	return ret
end

function Set.tostring(t)
	local ret = {}
	for k in pairs(t) do
		ret[#ret + 1] = k
	end
	return table.concat(ret,',')
end

function Set.print(t)
	print(Set.tostring(t))
end

--print("union:")
--local set1 = Set.new{"hello","world"}
--local set2 = Set.new{"hello","boy"}
--Set.print(Set.union(set1,set2))
--
--print("\nintersection:")
--local set3 = Set.new{"hello","world"}
--local set4 = Set.new{"hello","boy"}
--Set.print(Set.intersection(set1,set2))

mt.__add = Set.union
print("mt.__add union:")
local set5 = Set.new{1,2,3}
local set6 = Set.new{4,5,6}
local set7 = set5 + set6
Set.print(set7)

mt.__mul = Set.intersection
print("mt.__mul intersection:")
local set8 = Set.new{1,2,3}
local set9 = Set.new{3,5,6}
local set10 = set8 * set9
Set.print(set10)

mt.__tostring = Set.tostring
print(set10)

local autoSet = Set.new{}
print(getmetatable(autoSet))
--setmetatable({}) --this statement will raise an error
