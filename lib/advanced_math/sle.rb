require_relative 'sle/construct_extended_matrix'
require_relative 'sle/find_main_element_row_index'
require_relative 'sle/construct_decomposed_matrix'
require_relative 'sle/construct_decomposed_matrix_in_parallel'
require_relative 'sle/extract_matrix_from_extended_matrix'
require_relative 'sle/extract_vector_from_extended_matrix'
require_relative 'sle/perform_back_substitution'
require_relative 'sle/solve_by_lu_decomposition'
require_relative 'sle/solve_by_lu_decomposition_in_parallel'

module AdvancedMath
  class SLE
    attr_accessor :matrix, :vector

    def initialize(matrix: nil, vector: nil)
      @matrix = matrix
      @vector = vector
    end

    def solve_by_lu_decomposition
      SolveByLUDecomposition.new(
        matrix: matrix,
        vector: vector
      ).call
    end

    def solve_by_lu_decomposition_in_parallel(processors_amount: nil, processors: nil)
      SolveByLUDecompositionInParallel.new(
        matrix: matrix,
        vector: vector,
        processors: processors || ProcessorsFactory.create_processors(
          processors_amount: processors_amount,
          matrix: matrix
        )
      ).call
    end
  end
end
