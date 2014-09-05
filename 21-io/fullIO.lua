
--print(io.open("no exit file","r"))

--print(io.open("no exit file","w")) --write mode's default action is to create a "no exit file" file

--[[
local f = assert(io.open("hello.txt"),"r")
local str = f:read("*all")
f:close()
print(str)
--]]

--[[
local temp = io.output()
io.output("hello.txt")
io.output():write("hahahahahahahahaha")
io.output():close()
io.output(temp)
io.output():write("h")
--]]


--[[
local cc ,cl ,cw = 0,0,0
local BUFSIZE = 2^13 --8kb
local f = io.input("hello.txt")
while true do 
	local lines,rest = f:read(BUFSIZE,"*line")
	if not lines then
		break
	end
	if rest then 
		lines = lines .. rest .. '\n'
	end
	cc = cc + #lines
	
	local _,w = string.gsub(lines,"%S+","")
	cw = cw + w
	
	local _,l = string.gsub(lines,"\n","")
	cl = cl + l
end

print(cc,cw,cl)
--]]

--[[
local inp = assert(io.open("hello.txt","rb"))
local outp = assert(io.open("out.txt","wb"))

local str = inp:read("*all")
local astr = string.gsub(str,"\r\n","\n")
outp:write(astr)
inp:close()
outp:close()
--]]

---[[
function fsize(file)
	local current = file:seek()
	local size = file:seek("end")
	file:seek("set",current)
	return size
end

local file = assert(io.open("hello.txt","r"))
print(fsize(file))
file:close()
--]]







