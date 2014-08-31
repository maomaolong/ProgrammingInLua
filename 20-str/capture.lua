
local str = "name = hellop"
local name , value = string.match(str,"(%a+)%s=%s(%a+)")
print(name,value)
--[[
for k,v in pairs(_G) do
	print(k,v)
end
--]]

str = [[then he say:"it's all right!"]]
local q , say = string.match(str,"([\"\'])(.-)%1")
print(q,say)

str = "hello lua"
print(string.gsub(str,"%a","%0,%0"))
print(string.gsub(str,"(.)(.)","%2%1"))


