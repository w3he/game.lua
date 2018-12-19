local bst = {}

--- returns index, value
function rootNode()
  return 1, bst[1]
end

function search(n, i)
  i = i or 1
  
  if bst[i] == nil then return nil end
  
  if bst[i] == n then 
    return i 
  end  
  
  if n < bst[i] then
    return search(n, leftNode(i))
  else
    return search(n, rightNode(i))
  end
end

function leftNode(idx, n)
  if not idx and n then
    idx = search(n)
  end
  local left = idx * 2
  return left, bst[left]
end

function rightNode(idx, n)
  if not idx and n then
    idx = search(n)
  end
  local right = idx * 2 + 1
  return right, bst[right]
end

function add(n, i)
  if not i then i = 1 end
  local v = bst[i]
  if not v then
    bst[i] = n
  elseif n <= v then
    local left = leftNode(i)
    add(n, left)
  else
    add(n, rightNode(i))
  end
end

function remove(i, n)
  if not i then
    i = search(n)
  end
  
  if i == nil then return nil end
  
  if isLeaf(i) then
    local v = bst[i]
    bst[i] = nil
    return v
  end
  
  local left, lv = leftNode(i)    
  local right, rv = rightNode(i)
  if not lv then
    bst[i] = rv
    return remove(right)
  end
    
  if not rv then
    bst[i] = lv
    return remove(left)
  end
    
  -- replace with inorder successor
  -- start with right node, then find the left most leaf
  local node = right
  while(true) do
    left, lv = leftNode(node)
    if lv ~= nil then 
      node = left 
    else
      break
    end    
  end
  bst[i] = bst[node]
  return remove(node)
end


function isLeaf(i) 
  local left = 2 * i
  local right = 2 * i + 1
  return bst[left] == nil and bst[right] == nil 
end

function inorder(i)
  if bst[i] ~= nil then
    inorder(2*i)
    print (bst[i])
    inorder(2*i +1)
  end
end


function main()
  add(50)
  add(30)
  add(80)
  add(20)
  add(40)
  add(70)
  add(60)
  
  print("Created:")
  inorder(1)
  remove(nil,20)
  
  print("Removed 20:")
  inorder(1)
  
  remove(nil,30)  
  print("Removed 30:")
  inorder(1)
  remove(nil,50)
  print("Removed 50:")
  inorder(1)
  
  
end

main()

--return bst
  