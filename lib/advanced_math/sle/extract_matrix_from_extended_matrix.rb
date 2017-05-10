module AdvancedMath
  class SLE
    class ExtractMatrixFromExtendedMatrix
      attr_reader :extended_matrix

      def initialize(extended_matrix:)
        @extended_matrix = extended_matrix
      end

      def call
        matrix = Matrix.new(
          row_size: extended_matrix.row_size,
          column_size: extended_matrix.column_size - 1
        )

        matrix.row_size.times do |i|
          matrix.column_size.times do |j|
            matrix[i][j] = extended_matrix[i][j]
          end
        end

        matrix
      end
    end
  end
end
