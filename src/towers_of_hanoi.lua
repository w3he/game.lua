local Tower = {
  A = {},
  B = {},
  C = {},
}


function Tower:new(o)
  local o = o or {}
  setmetatable(o, self)
  self.__index = self
  
  local level = o.level or 3
  for i = level, 1, -1 do
      table.insert(self.A, i)
  end
  
  return o
end

function Tower:solve()
    moveTower(#self.A, self.A, self.B, self.C)
end

function moveTower(level, tower1, tower2, tower3)
  if (level == 1) then
    move(tower1, tower2)
    return
  end
  --assert(#tower2 == 0 and #tower3 == 0)
  moveTower(level -1, tower1, tower3, tower2)
  move(tower1, tower2)
  moveTower(level -1, tower3, tower2, tower1)
end

function move(peg1, peg2) 
    local n = table.remove(peg1)
    if #peg2 == 0 or n < peg2[#peg2] then
      table.insert(peg2, n)
    else
      table.insert(peg1, n)
      error ("Illegal move")
    end
end

local tower = Tower:new({level = 29})
Tower.solve(tower)

assert(#tower.A ==0 and #tower.B ==tower.level and #tower.C == 0)
print('A:', table.unpack(tower.A))
print('B:', table.unpack(tower.B))
print('C:', table.unpack(tower.C))