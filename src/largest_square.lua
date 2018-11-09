LargestSquare = {}

matrix = require 'matrix'

function LargestSquare.largest_square(mat)
  local result = 0
  local cache = matrix.copy(mat)
  for r = 1, #mat do
    for c = 1, #mat[1] do
      if (r>1 and c>1 and mat[r][c]==1) then
        cache[r][c] = 1 + math.min(cache[r-1][c-1], cache[r][c-1], cache[r-1][c])
      end
      if (result < cache[r][c]) then
        result = cache[r][c]
      end
    end
  end
  return result
end

return LargestSquare
  