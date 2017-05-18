require_relative 'sorter/sort_by_quicksort'
require_relative 'sorter/sort_by_quicksort_in_parallel'

module AdvancedMath
  class Sorter
    attr_reader :vector

    def initialize(vector:)
      @vector = vector
    end

    def sort_by_quicksort
      SortByQuicksort.new(vector: vector).call
    end

    def sort_by_quicksort_in_parallel
      SortByQuicksorInParallel.new(vector: vector).call
    end
  end
end
