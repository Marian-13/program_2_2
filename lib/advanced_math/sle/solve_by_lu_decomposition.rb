module AdvancedMath
  class SLE
    class SolveByLUDecomposition
      attr_reader :matrix, :vector

      def initialize(matrix:, vector:)
        @matrix = matrix
        @vector = vector
      end

      def call
        decomposed_matrix = ConstructDecomposedMatrix.new(
          matrix: matrix,
          vector: vector
        ).call

        PerformBackSubstitution.new(
          decomposed_matrix: decomposed_matrix
        ).call
      end
    end
  end
end
