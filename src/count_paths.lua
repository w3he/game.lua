--[[
find paths thought maze
]]

package.path = "src/?.lua;"..package.path
print(package.path)

matrix = require 'matrix'

function countPath(maze)
  local results = matrix.copy(maze)
  for r=#maze, 1 , -1 do
    for c= #maze[1], 1, -1 do
      if maze[r][c] > 0 and r < #maze and c< #maze[1] then
        results[r][c] = results[r+1][c] + results[r][c+1]
      elseif maze[r][c]>0 and r<#maze then
          results[r][c] = results[r+1][c]
      
      elseif maze[r][c]>0 and c<#maze[1] then
          results[r][c] = results[r][c+1]
      else
      end
          print(r, c, results[r][c])
    end
  end
  return results[1][1]
end

board = {
    {1, 1, 1, 1, 1, 0, 1},
    {1, 0, 1, 0, 1, 0, 1},
    {1, 1, 1, 0, 1, 0, 1},
    {1, 0, 1, 1, 1, 1, 1},
    {1, 0, 0, 1, 1, 0, 1},
    {1, 0, 1, 1, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1}
}
        
print(countPath(board))
        