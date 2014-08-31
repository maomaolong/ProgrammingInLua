
--[[
io.output("hello.txt")
io.write("this is write to hello.txt")
io.output(io.stdout)
io.write("this is write to stdout\n")
print("this is print")
--]]
print(io.read("*line"))
