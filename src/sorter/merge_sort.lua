local Merge = {}

function Merge.sort(vector, s, e)
  local size = e - s + 1
  if size == 1 then
    return
  elseif size == 2 then
    if vector[s] > vector[e] then
      vector[s], vector[e] = vector[e], vector[s]
    end
    return
  else
    -- partition
    size = math.ceil(size /2)
    Merge.sort(vector, s, s + size-1)
    Merge.sort(vector, s+size, e)
    merge(vector, s, s+size-1, e)
  end
end


local function merge(vector, s, mid, e)
  --print(s,e)
  local mergeTable = {}
  local i = s
  local j = mid+1
  local tmp = vector[i]
  repeat
    if j <=e and tmp > vector[j] then
      table.insert(mergeTable, vector[j])
      j=j+1
    else
      i = i + 1
      table.insert(mergeTable, tmp)
      tmp = vector[i]
    end
  until i > mid
  for i = j-1, s, -1 do
    vector[i] = table.remove(mergeTable)
  end
end


return Merge
