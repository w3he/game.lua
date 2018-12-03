local Sorter = {
  Heap = require "sorter.heap",
  Bubble = require 'sorter.bubble_sort',
  Insertion = require 'sorter.insertion_sort',
  Merge = require 'sorter.merge_sort',
  QuickHoare = require 'sorter.quick_sort_hoare',
  QuickLomuto = require 'sorter.quick_sort_lomuto',
  Selection = require 'sorter.selection_sort',
  Shell = require 'sorter.shell_sort'
}

function Sorter.choose(sorter)
  return Sorter[sorter]
end

return Sorter