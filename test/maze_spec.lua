ls = require 'largest_square'
matrix = require 'matrix'
maze = require 'maze'
board  = nil

describe("test matrix", function()
    setup(function()
        print("setup board")
        board = {
            {1, 1, 1, 1, 1, 0, 1},
            {0, 0, 1, 0, 1, 0, 1},
            {1, 1, 1, 0, 1, 0, 1},
            {1, 0, 1, 1, 1, 1, 1},
            {1, 0, 0, 0, 1, 0, 0},
            {1, 0, 1, 1, 0, 0, 1},
            {1, 1, 1, 1, 1, 1, 1}
        }
        end)
    
    it("largest square", function()
          local result = ls.largest_square(board)
        assert.are.equal(2, result, "Failed the test")
    end)
  
    it("maze", function()
        local visited = {}
        local path = {}
        local moves = {{1,1}}

        maze.move(board, moves, path, visited)
        maze.printPath(board, path, visited)
        assert.is_true(#path > 0)
    end)
  
    teardown(function()
        print("teardown")
        board = nil
        end)
  
  end)