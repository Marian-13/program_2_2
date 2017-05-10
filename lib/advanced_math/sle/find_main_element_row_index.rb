module AdvancedMath
  class SLE
    class FindMainElementRowIndex
      attr_reader :matrix, :index

      def initialize(attrs_hash)
        @matrix = attrs_hash[:matrix]
        @index  = attrs_hash[:index]
      end

      def call
        main_element = matrix[index][index].abs
        main_element_row_index = index

        ((index + 1)...matrix.row_size).each do |i|
          if matrix[i][index].abs > main_element
            main_element = matrix[i][index]
            main_element_row_index = i
          end
        end

        main_element_row_index
      end
    end
  end
end
