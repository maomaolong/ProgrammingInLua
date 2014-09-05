
--[[
os.rename("hello.txt","myhello.txt")
os.remove("out.txt")
--]]

--[[
print(os.time())
print(os.time{year = 1970,month = 1, day = 1, hour = 8,})
--]]

--[[
local dateInfo = os.date("*t",os.time())
for k,v in pairs(dateInfo) do
	print(k,v)
end
--]]

--[[
print(os.date("today is %A in %B"))
print(os.date("%x",os.time()))
print(os.date("%Y/%m/%d"))
--]]

--[[
local tstart = os.clock()
for i = 1,1000000 do 
	
end
print("use " .. (os.clock() - tstart) .. " s")
--]]

--print(os.getenv("CLASSPATH"))

function createDir(dirname)
	os.execute("mkdir " .. dirname)
end
createDir("fold")