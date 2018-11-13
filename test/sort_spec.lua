package.path = "./src/?.lua;"..package.path

-- input vector
local v = {}

describe("Unit test quick sort", function()
    setup( function()
      for i=1,10 do
        v[i] = math.random(100)
      end
    end)
    
    it("with lomuto partition", function() 
      local quick = require 'quick_sort_hoare'        
      local vector = {unpack(v)}
      quick.sort(vector)

      print(unpack(vector))
    end)
  
    it("with lomuto partition", function() 
      local quick = require 'quick_sort_lomuto'        

      quick.sort(v)

      print(unpack(v))
    end)
  
    teardown(function()
    end)

end)
