local Insertion = {}

function Insertion.sort(vector)
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

return Insertion
