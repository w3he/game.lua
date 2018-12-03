local Bubble = {}

function Bubble.sort(vector)
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

return Bubble