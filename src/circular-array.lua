--circular array

function isSingleCompleteCycle(a)
  local size = table.maxn(a)
  if size == 0 then 
    return false 
  elseif size == 1 then
    return true
  end
  
  local idx = 1
  for i=1,#a do
    local n = a[idx]
    if n == 0 then return false end
    a[idx] = 0
    idx = idx + n
    if (idx > #a or idx <= -#a) then
      idx = idx - math.floor(idx/#a) * #a
    end
    if idx <= 0 then idx = idx + #a end    
  end
  print(table.unpack(a))
  return idx == 1
end

local arr = {2,2,-1,3,3,-1,-1}

print ("My answer:", isSingleCompleteCycle(arr))