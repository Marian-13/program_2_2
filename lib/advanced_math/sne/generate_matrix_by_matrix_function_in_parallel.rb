module AdvancedMath
  class SNE
    class GenerateMatrixByMatrixFunctionInParallel
      attr_reader :matrix_function, :vector, :processors

      def initialize(matrix_function:, vector:, processors:)
        @matrix_function = matrix_function
        @vector          = vector
        @processors      = processors
      end

      def call
        sle_matrix = Matrix.new(
          row_size: matrix_function.row_size,
          column_size: matrix_function.column_size
        )

        matrix_function.row_size.times do |i|
          processors.each do |processor|
            processor.add_task do |row_indices|
              if row_indices.include?(i)
                matrix_function.column_size.times do |j|
                  sle_matrix[i][j] = matrix_function[i][j].call(vector)
                end
              end
            end
          end

          processors.each(&:wait)
        end

        sle_matrix
      end
    end
  end
end
