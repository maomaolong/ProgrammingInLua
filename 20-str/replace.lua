
function replace(s)
	return (string.gsub(s,"(%w+)",_G))
end

name = "lua"
say = "hello"

local str = "$name and $say3"
print(string.gsub(str,"$(%w+)",replace))
