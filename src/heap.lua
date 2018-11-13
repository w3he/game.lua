local Heap = {}

--- use an array to store a min heap
-- 1>2,3>4,5;6,7

function Heap:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

local function getParentIndex(i)
  return math.floor(i/2)
end

local function getLeftChildIndex(i)
  return i+i
end

local function getRightChildIndex(i)
  return i + i + 1
end

local function heapifyUp(self, i)
  if i == 1 then
    return
  end
  local p = getParentIndex(i)
  if self[p] > self[i] then
    self[p], self[i] = self[i], self[p]
  end
  heapifyUp(self, p)
end

local function heapifyDown(self, i)
  if i == #self then
    return
  end
  local lc = getLeftChildIndex(i)
  if self[lc] == nil then
    return
  end
  local min = lc
  
  local rc = getRightChildIndex(i)
  --print (min, rc)
  if self[rc] ~= nil and self[min] > self[rc] then min = rc end
  
  if self[i] > self[min] then
    self[min], self[i] = self[i], self[min]
  end
  heapifyDown(self, min)
end

function Heap.peak(self)
  return self[1]
end

function Heap.push(self, v)
  self[#self +1] = v
  heapifyUp(self, #self)
end

function Heap.pop(self)
  local min = self[1]
  self[1], self[#self] = self[#self], nil
  heapifyDown(self, 1)
  return min
end

function Heap.replace(self, v)
  self[1] = v
  heapifyDown(self, 1)
end

function Heap:size()
  return #self
end

function Heap:isEmpty()
  return #self == 0
end

function Heap.merge(self, heap)
  for _,v in ipairs(heap) do
    self:push(v)
  end
end

function Heap.sort(vector)
  local heap = Heap:new()
  for i=1,#vector do
    heap:push(vector[i])
  end
  for i=1,#vector do
    vector[i] = heap:pop()
  end
end
  


return Heap


  