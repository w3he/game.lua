package.path = "./src/?.lua;./src/?/init.lua;"..package.path

local sorter = require 'sorter'
-- input vector
local v = {}

describe("Unit test quick sort", function()
    setup( function()
      for i=1,10 do
        v[i] = math.random(100)
      end
    end)
    
    it("with lomuto partition", function() 
      local quick = sorter.choose 'QuickHoare'        
      local vector = {unpack(v)}
      quick.sort(vector)

      print(unpack(vector))
    end)
  
    it("with lomuto partition", function() 
      local quick = sorter.choose 'QuickLomuto'        

      quick.sort(v)

      print(unpack(v))
    end)
  
    teardown(function()
    end)

end)
