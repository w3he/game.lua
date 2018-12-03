QuickSort = {}

require 'sorting'

--[[
algorithm quicksort(A, lo, hi) is
    if lo < hi then
        p := partition(A, lo, hi)
        quicksort(A, lo, p - 1 )
        quicksort(A, p + 1, hi)

algorithm partition(A, lo, hi) is
    pivot := A[hi]
    i := lo - 1  
    for j := lo to hi - 1 do
        if A[j] < pivot then
            if i != j then
                i := i + 1
                swap A[i] with A[j]
           
    i := i + 1
    swap A[i] with A[hi]
    return i
]]


function QuickSort.sort(vector, s, e)
  s = s or 1
  e = e or #vector
  showProgress(vector, s, 0, 0, e, 0, "start a new partition")
  
  if (s == e-1) then --only two elements to be sorted
    if vector[s] > vector[e] then
      vector[s], vector[e] = vector[e], vector[s]
    end
    return
  end
  
  --partition
  local pivot = vector[e]
  local l = s-1
  for r =s,e-1 do
    showProgress(vector, s, l, r, e, e, "start picking l,r")
    
    if vector[r] < pivot then
      if l ~= r then
        showProgress(vector, s, l, r, e, e, "after picked l,r")
        l = l+1
        vector[l],vector[r] = vector[r],vector[l]
      end
    end
  end
  showProgress(vector, s, l, r, e, e, "after picked l,r")
  l = l+1
  vector[l],vector[e] = vector[e],vector[l]
  
  showProgress(vector, s, l, r, e, l, "before new partition")
  
  if (s<l-1) then
    QuickSort.sort(vector, s, l-1)
  end
  
  if (e>l+1) then
    QuickSort.sort(vector, l+1, e)
  end 
end

return QuickSort
