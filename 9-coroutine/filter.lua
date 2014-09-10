

--在前面代码中添加一个过滤器，在每行起始处添加一个行号

function receive(prod)
	local statu,value = coroutine.resume(prod)
	return value
end

function send(x)
	coroutine.yield(x)
end

function producer()
	return coroutine.create(
		function()
			while true do 
				local x = io.read()
				send(x)
			end
		end
	)
end

function filter(prod)
	return coroutine.create(
		function()
			for line = 1,math.huge do
				local x = receive(prod)
				x = string.format("%5d %s",line,x)
				send(x)
			end
		end
	)
end

function consumer(prod)
	while true do 
		local x = receive(prod)
		print(x)
	end
end

consumer(filter(producer()))