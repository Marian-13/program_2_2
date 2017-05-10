module AdvancedMath
  class SLE
    class ConstructExtendedMatrix
      attr_reader :matrix, :vector

      def initialize(matrix:, vector:)
        @matrix = matrix
        @vector = vector
      end

      def call
        extended_matrix = Matrix.new(
          row_size: matrix.row_size,
          column_size: matrix.column_size + 1
        )

        matrix.row_size.times do |i|
          extended_matrix[i] = matrix[i] + [vector[i]]
        end

        extended_matrix
      end
    end
  end
end
