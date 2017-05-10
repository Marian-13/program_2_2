module AdvancedMath
  class SNE
    class GenerateMatrixByMatrixFunction
      attr_reader :matrix_function, :vector

      def initialize(matrix_function:, vector:)
        @matrix_function = matrix_function
        @vector          = vector
      end

      def call
        sle_matrix = Matrix.new(
          row_size: matrix_function.row_size,
          column_size: matrix_function.column_size
        )

        matrix_function.row_size.times do |i|
          matrix_function.column_size.times do |j|
            sle_matrix[i][j] = matrix_function[i][j].call(vector)
          end
        end

        sle_matrix
      end
    end
  end
end
