local Selection = {}

function Selection.sort(vector)

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

return Selection