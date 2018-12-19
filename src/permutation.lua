Factorial = {}

local function factorial(n)
  if (n == 0 ) then return 1 end
  if Factorial[n] == nil then
    Factorial[n] = n * factorial(n -1)
  end
  return Factorial[n]
end

local function permutations(n, r) 
  return factorial(n) / factorial (n - r)
end
   
local function combinations(n, r)
  return permutations(n, r) / factorial(r)
end

--- n=5 kinds of ice creams
--- r=3 scoops
--- o -> -> -> -> o o
--- -> o o o -> -> -> 
--- -> o -> o -> -> o

local function multiset(n, r)
  return combinations(n + r -1, r)
end

print("Perm('Bobby22'): ", permutations(7,7)/factorial(2)/factorial(3))
print("Perm(4 digits out of 1,1,1,2,2,3,4,5,5,5):", permutations(10, 4)/factorial(3)/factorial(2)/factorial(3))
print("Perm(7 digits out of 1,1,1,2,2,2,5,5,5,5):", permutations(10, 7)/factorial(3)/factorial(4)/factorial(3))
print("Perm(5 green, 3 red, 7 yellow):", permutations(15, 15)/factorial(5)/factorial(7)/factorial(3))

print("Factor(5) is ", factorial(5))
print("Perm(5,2) is ", permutations(5,2))
print("Combo(5,2) is ", combinations(5,2))


-- How many distinct words of any (nonzero) length can be formed using the letters of KEPLER at most once each?

-- (Clarification: such a word can have two Es, but can't have duplicates of any other letter.)

--local function main() 
  local total = 0
  local counts = {}
  -- with one letter, including only 1 E
  counts[1] = permutations(5, 1)
  
  -- with 2 letters, including only 1 E, and then 2 E
  -- combination term is about how non-E letters are included in the words
  counts[2] = permutations(5, 2) + combinations(4,0) * permutations(2,2) / factorial(2)
  
  print("Perm(6,2)", permutations(6, 2) /factorial(2))
  
  -- with 3 letters, including only 1 E, and then 2 E
  counts[3] = permutations(5, 3) + combinations(4,1) * permutations(3,3) / factorial(2)
  
  -- with 4 letters, including only 1 E, and then 2 E
  counts[4] = permutations(5, 4) + combinations(4,2) * permutations(4,4) / factorial(2)
  
  -- with 5 letters, including only 1 E, and then 2 E
  counts[5] = permutations(5, 5) + combinations(4,3) * permutations(5,5) / factorial(2)
  
  -- with 6 letters
  counts[6] = permutations(6, 6) / factorial(2)
  
  for k,v in ipairs(counts) do
    total = total + v
  end
  
  print("Word counts:", table.unpack(counts))
  print ("Total word counts: ", total)
--end

--1. In how many ways can the letters of the word REFERENCE be arranged?
local len = string.len('REFERENCE')
print("Rearrange(REFERENCE)", permutations(len,len)/factorial(4)/factorial(2))

-- 2. In how many ways can the letters of the word MISSISSIPPI be arranged?
len = string.len('MISSISSIPPI')
print("P(11,11)", permutations(11, 11))
print("Rearrange(MISSISSIPPI)", permutations(len, len)/factorial(4)/factorial(4)/factorial(2))

-- 3. 

-- 4. A math test is made up of 15 multiple choice questions. 
--    5 questions have the answer A, 
--    4 have the answer B, 
--    3 have the answer C, 
--    2 have the answer D, 
--    1 has the answer E. 

print("How many answer sheets are possible?", permutations(15,15)/factorial(5)/factorial(4)/factorial(3)/factorial(2))

-- 5. How many different 5-digit numerals can be written using the following 9 digits? 2, 2, 2, 7, 7, 8, 8, 8, 9
print("This is wrong!", permutations(9,5) /factorial(3)/factorial(2)/factorial(3))



--1,1,2,3
--permutations(4,2)/factorial(2)

--11, 12, 21, 31, 32, 13, 23