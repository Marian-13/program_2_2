require_relative 'sne/generate_matrix_by_matrix_function'
require_relative 'sne/generate_matrix_by_matrix_function_in_parallel'
require_relative 'sne/generate_vector_by_vector_function'
require_relative 'sne/generate_vector_by_vector_function_in_parallel'
require_relative 'sne/solve_by_newton_method'
require_relative 'sne/solve_by_newton_method_in_parallel'

module AdvancedMath
  class SNE
    attr_reader :vector_function, :matrix_function

    def initialize(vector_function:, matrix_function: nil)
      @vector_function = vector_function
      @matrix_function = matrix_function
    end

    def solve_by_newton_method(initial_vector: nil, epsilon:)
      SolveByNewtonMethod.new(
        vector_function: vector_function,
        matrix_function: matrix_function,
        initial_vector: initial_vector,
        epsilon: epsilon
      ).call
    end

    def solve_by_newton_method_in_parallel(initial_vector: nil, epsilon:, processors_amount: nil, processors: nil)
      SolveByNewtonMethodInParallel.new(
        vector_function: vector_function,
        matrix_function: matrix_function,
        initial_vector: initial_vector,
        epsilon: epsilon,
        processors: processors || ProcessorsFactory.create_processors(
          processors_amount: processors_amount,
          matrix: matrix_function
        )
      ).call
    end
  end
end
