module AdvancedMath
  class Sorter
    class SortByQuicksort
      attr_reader :vector

      def initialize(vector:)
        @vector = vector
      end

      def call
        vector.copy.tap do |sorted_vector|
          perform_quicksort(sorted_vector, 0, sorted_vector.size - 1)
        end
      end

      private
        # Returns index of pivotal element
        def perform_partitioning(vector, lower_index, higher_index)
          pivot = vector[higher_index]
          i = lower_index - 1

          (lower_index...higher_index).each do |j|
            if vector[j] <= pivot
              i += 1
              vector.swap_elements!(i, j)
            end
          end

          vector.swap_elements!(i + 1, higher_index)
          i + 1
        end

        def perform_quicksort(vector, lower_index, higher_index)
          if lower_index < higher_index
            pivot_index = perform_partitioning(vector, lower_index, higher_index)
            perform_quicksort(vector, lower_index, pivot_index - 1)
            perform_quicksort(vector, pivot_index + 1, higher_index)
          end
        end
    end
  end
end
