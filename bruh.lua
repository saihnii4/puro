M = {}

return setmetatable(M, {
  __index = function(t, i)
    for k, v in pairs(t) do
    	local start, end = unpack(string.find(i, k))
	if (start == 1) and (end == i:len()) then
		return v
	end
    end
    return nil
  end,
})
