local Shell = {}

function Shell.sort(vector)
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

return Shell