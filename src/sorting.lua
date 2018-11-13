Sorting={_NAME="Sorting", _VERSION="1.0"}

package.path = './src/?.lua;'..package.path

Heap = require 'Heap'

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
--[[
for k,v in Sorting.pairsByKeys(Sorting,f) do
  print(k,v)
end
]]
function selectionSort(vector)

  for i=1,#vector do
    local mindex = i
    for j=i, #vector do
      if (vector[j] < vector[mindex]) then
        mindex = j
      end
    end
    if i ~= mindex then
      vector[i], vector[mindex] = vector[mindex], vector[i]
    end
  end
end

function insertionSort(vector)
  for i=2,#vector do
    for j=i-1,1,-1 do
      if vector[i] > vector[j] then
        if i>j+1 then
          table.insert(vector, j, table.remove(vector, i))
        end
        break;
      elseif j==1 then
        table.insert(vector, j, table.remove(vector, i))
      end
    end
  end
end

function mergeSort(vector, s, e)
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
    mergeSort(vector, s, s + size-1)
    mergeSort(vector, s+size, e)
    merge(vector, s, s+size-1, e)
  end
end
  
function merge(vector, s, mid, e)
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

function bubbleSort(vector)
  local endIndex = #vector -1
  repeat
    local swapped = false
    for j = 1, endIndex do
      if vector[j] > vector[j +1] then
        vector[j], vector[j +1] = vector[j+1], vector[j]
        swapped = true
      end
    end
    endIndex = endIndex -1
  until not swapped
end  

function shellSort(vector)
  local gap = math.floor(#vector /2)
  repeat
    local swapped = false
    for j = 1, #vector-gap do
      if (vector[j] > vector[j + gap]) then
        vector[j], vector[j+gap] = vector[j+gap], vector[j]
        swapped = true
      end
    end
    gap = math.ceil(gap /2)
  until gap <= 1 and not swapped
end

function heapSort(vector)
  local heap = Heap:new()
  for i=1,#vector do
    heap:push(vector[i])
  end
  for i=1,#vector do
    vector[i] = heap:pop()
  end
end
  
function quickSort(vector, s, e)
  if s+1 == e then
    if vector[s] > vector[e] then
      vector[s], vector[e] = vector[e], vector[s]
    end
    return
  end
  
  local pi = math.floor((s + e)/2)
  local pivot = vector[pi]
  local left, right = s, e
  while(left<right) do
    while(left < e and vector[left] <= pivot) do
      left = left+1
    end
    while(right > s and pivot<= vector[right]) do
      right = right-1
    end
    print(s, left, pi, right, e)
    if (left < right) then
      vector[left], vector[right] = vector[right], vector[left]
      left = left +1
      right = right-1
    end
  end
  
  if (left > s) then
    quickSort(vector, s, left)
  end
  if (left+1 < e) then
    quickSort(vector, left+1, e)
  end
end

  

local v={}

for i = 1, 10 do
  v[i] = math.random(100)
end
--print (unpack(v))
local started = os.time()

quickSort(v, 1, #v)
--heapSort(v)
--mergeSort(v, 1, #v)
--shellSort(v)
--bubbleSort(v)
--insertionSort(v)
--selectionSort(v)
--print (unpack(v))

-- verify
local lapse = os.time() - started
print ("Sorting completed in secs:", lapse)
print (unpack(v))
for i=1, #v -1 do
  assert(v[i] <= v[i+1], "unexpected.")
end