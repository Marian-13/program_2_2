module AdvancedMath
  class SLE
    class PerformBackSubstitution
      attr_reader :decomposed_matrix

      def initialize(decomposed_matrix:)
        @decomposed_matrix = decomposed_matrix
      end

      def call
        size = decomposed_matrix.row_size

        matrix_u = extract_matrix_from_extended_matrix(decomposed_matrix)
        vector_y = extract_vector_from_extended_matrix(decomposed_matrix)

        vector_x = Vector.new(size: size)

        (0...size).reverse_each do |i|
          ((i + 1)...size).each do |j|
            vector_y[i] -= matrix_u[i][j] * vector_x[j]
          end

          vector_x[i] = vector_y[i] / matrix_u[i][i]
        end

        vector_x
      end

      private
        def extract_matrix_from_extended_matrix(extended_matrix)
          ExtractMatrixFromExtendedMatrix.new(
            extended_matrix: extended_matrix
          ).call
        end

        def extract_vector_from_extended_matrix(extended_matrix)
          ExtractVectorFromExtendedMatrix.new(
            extended_matrix: extended_matrix
          ).call
        end
    end
  end
end
