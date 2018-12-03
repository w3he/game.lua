local QuickSort = {}

require 'sorting'

--[[
algorithm quicksort(A, lo, hi) is
    if lo < hi then
        p := partition(A, lo, hi)
        quicksort(A, lo, p)
        quicksort(A, p + 1, hi)

algorithm partition(A, lo, hi) is
    pivot := A[lo]
    i := lo - 1
    j := hi + 1
    loop forever
        do
            i := i + 1
        while A[i] < pivot

        do
            j := j - 1
        while A[j] > pivot

        if i >= j then
            return j

        swap A[i] with A[j]
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
  local pi = math.floor((s+e)/2)
  local pivot = vector[pi]
  local l,r = s,e
  while(l<=r) do
    
    showProgress(vector, s, l, r, e, pi, "start picking l,r")
    while(vector[l] < pivot) do
      l=l+1
    end
    
    while(vector[r] > pivot) do
      r=r-1
    end
    
    showProgress(vector, s, l, r, e, pi, "after picked l,r")
    
    if (l<=r) then
      vector[l],vector[r] = vector[r],vector[l]
      if pi == l then pi = r end
      if pi == r then pi = l end
      
      l=l+1
      r=r-1
    end
  end
  
  showProgress(vector, s, l, r, e, pi, "before new partition")
  
  if (s<l-1) then
    QuickSort.sort(vector, s, l-1)
  end
  
  if (e>l) then
    QuickSort.sort(vector, l, e)
  end 
end

return QuickSort