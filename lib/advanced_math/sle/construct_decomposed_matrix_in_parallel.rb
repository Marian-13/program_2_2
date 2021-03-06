module AdvancedMath
  class SLE
    class ConstructDecomposedMatrixInParallel # TODO Inheritance or Mixin
      attr_reader :matrix, :vector, :processors_amount, :processors

      def initialize(matrix:, vector:, processors:)
        @matrix     = matrix
        @vector     = vector
        @processors = processors
      end

      def call
        decomposed_matrix = construct_extended_matrix(matrix, vector)

        (0...(decomposed_matrix.row_size - 1)).each do |k|
          main_element_row_index =
            find_main_element_row_index(decomposed_matrix, k)

          if main_element_row_index != k
            decomposed_matrix.swap_rows!(k, main_element_row_index)
          end

          processors.each do |processor|
            processor.add_task do |row_indices|
              ((k + 1)...decomposed_matrix.row_size).each do |i|

                if row_indices.include? i
                  ((k + 1)...decomposed_matrix.column_size).each do |j|
                    decomposed_matrix[i][j] -=
                      (decomposed_matrix[i][k] / decomposed_matrix[k][k]) *
                      decomposed_matrix[k][j]
                  end
                end
              end
            end
          end

          processors.each(&:wait)
        end

        processors.each(&:join)

        decomposed_matrix
      end

      private
        def construct_extended_matrix(matrix, vector)
          ConstructExtendedMatrix.new(
            matrix: matrix,
            vector: vector
          ).call
        end

        def find_main_element_row_index(decomposed_matrix, index)
          FindMainElementRowIndex.new(
            matrix: decomposed_matrix,
            index: index
          ).call
        end
    end
  end
end
