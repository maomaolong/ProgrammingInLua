
--�˴�Ҫע��declare�����ڵ���setmetatable(_G,mt)֮ǰ���壬��Ϊlua�к���Ҳ�ǵ�һ��ֵ������declareҲ��ȫ�ֱ���
function declare(name,initval)
	rawset(_G,name,initval or false)
end

local mt = {
	__index = function(t,k)
		error("error attempt to read a Undefined variable " .. tostring(k))
	end
	,
	__newindex = function(t,k,v)
		error("error attempt to write a Undefined variable " .. tostring(k))
	end
}

setmetatable(_G,mt)
--print(a)
--a = 10

--declare (a,10) --error
declare ("a",10) --right
print(a)
