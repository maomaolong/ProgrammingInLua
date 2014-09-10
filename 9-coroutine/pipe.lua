
--解决生产者消费者问题（消费者驱动）

function comsumer()
	while true do 
		local v = receive()
		print(v)
	end
end

local producer = coroutine.create( 
	function()
		while true do 
			local x = io.read()
			send(x)
		end
	end)

function receive()
	local statu,value = coroutine.resume(producer)
	return value
end

function send(x)
	coroutine.yield(x)
end

comsumer()












