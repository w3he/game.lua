Maze={}

function Maze:new(o) 
  o = o or {}
  
  setmetatable(o, self)
  self.__index = self
  
  return o
end


local function contains(list, r, c)
  for _,v in ipairs(list) do
    if #v ==2 and r == v[1] and c == v[2] then return true end
  end
  return false
end

-- print list of coord pairs
function Maze.printPath(maze, path, visited)
  
  for r=1, #maze do
    for c=1, #maze[1] do
      if (contains(path, r, c)) then 
        io.write(' ', '=') 
      elseif (contains(visited, r, c)) then 
        io.write(' ', '*')
      else
        io.write(' ', maze[r][c])
      end
    end
    print()
  end
  print()
end

local function check_next(maze, r, c, visited)
  if r<1 or c<1 or r>#maze or c>#maze[1] or maze[r][c] == 0 then
    return false
  end
  
  for _,v in ipairs(visited) do
    local rv, cv = unpack(v)
    if (rv == r and cv == c) then
      --old path
      return false
    end
  end
  return true
end

function Maze.move(maze, moves, path, visited)
  
  for _,v in ipairs(moves) do
    local r,c = unpack(v)
    table.insert(visited, {r,c})
    
    if (r == #maze and c == #maze[1]) then
      table.insert(path, {r,c})
      return true
    end
    
    local nextMoves = {}
    if (check_next(maze, r,c+1, visited)) then
        table.insert(nextMoves, {r, c+1})
    end
    if (check_next(maze, r+1,c, visited)) then
        table.insert(nextMoves, {r+1, c})
    end
    if (check_next(maze, r,c-1, visited)) then
        table.insert(nextMoves, {r, c-1})
    end
    if (check_next(maze, r-1,c, visited)) then
        table.insert(nextMoves, {r-1, c})
    end
    if (#nextMoves > 0) then
      table.insert(path, {r, c})     
      if (Maze.move(maze, nextMoves, path, visited)) then return true end
    end
  end
  -- not moved, so let's backtracking
  table.remove(path)
  return false
end

return Maze
