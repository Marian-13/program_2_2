module AdvancedMath
  class SLE
    class ExtractVectorFromExtendedMatrix
      attr_reader :extended_matrix

      def initialize(extended_matrix:)
        @extended_matrix = extended_matrix
      end

      def call
        vector_size = extended_matrix.row_size

        vector = Vector.new(size: vector_size)

        vector_size.times do |i|
          vector[i] = extended_matrix[i][vector_size]
        end

        vector
      end
    end
  end
end
