Sorting={_NAME="Sorting", _VERSION="1.0"}

package.path = './src/?.lua;'..package.path

function showProgress(vector, s, l, r, e, pi, comments)
  for i=1,#vector do
    local notation = tostring(vector[i])
    if i == pi then
      notation = "("..notation..')'
    end
    if i == s then
      notation = "["..notation
    elseif i==e then
      notation = notation.."]"
    end
    
    if i == l then
      notation = notation..","
    end
    
    if i == r then
      notation = notation..';'
    end
    io.write(notation, " ")
  end
  
  if (comments ~= nil) then
    print(comments)
  end
end

function Sorting.pairsByKeys (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

return Sorting
