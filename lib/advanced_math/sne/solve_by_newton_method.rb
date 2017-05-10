module AdvancedMath
  class SNE
    class SolveByNewtonMethod
      attr_reader :vector_function, :matrix_function, :initial_vector, :epsilon

      def initialize(vector_function:, matrix_function:, initial_vector:, epsilon:)
        @vector_function = vector_function
        @matrix_function = matrix_function
        @initial_vector  = initialize_initial_vector(initial_vector)
        @epsilon         = epsilon
      end

      def call
        sle = SLE.new

        k = 0
        current_vector_x = initial_vector
        next_vector_x    = nil

        loop do
          k += 1

          sle.matrix = generate_matrix_by_matrix_function(
            matrix_function,
            current_vector_x
          )
          sle.vector = -generate_vector_by_vector_function(
            vector_function,
            current_vector_x
          )

          next_vector_delta_x = sle.solve_by_lu_decomposition
          next_vector_x = current_vector_x + next_vector_delta_x

          if stop_condition_satisfied?(current_vector_x, next_vector_x, epsilon)
            break
          else
            current_vector_x = next_vector_x
          end
        end

        create_iterative_method_result(next_vector_x, k)
      end

      private
        def initialize_initial_vector(initial_vector)
          initial_vector || default_initial_vector
        end

        def default_initial_vector
          Vector.new(elements: Array.new(vector_function.size) { 0.0 })
        end

        def stop_condition_satisfied?(current_vector_x, next_vector_x, epsilon)
          modulus_of_difference =
            (next_vector_x.compute_norm - current_vector_x.compute_norm).abs

          modulus_of_difference < epsilon
        end

        def generate_matrix_by_matrix_function(matrix_function, vector)
          GenerateMatrixByMatrixFunction.new(
            matrix_function: matrix_function,
            vector: vector
          ).call
        end

        def generate_vector_by_vector_function(vector_function, vector)
          GenerateVectorByVectorFunction.new(
            vector_function: vector_function,
            vector: vector
          ).call
        end

        def create_iterative_method_result(vector, amount_of_iterations)
          IterativeMethodResult.new(
            vector: vector,
            amount_of_iterations: amount_of_iterations
          )
        end
    end
  end
end
