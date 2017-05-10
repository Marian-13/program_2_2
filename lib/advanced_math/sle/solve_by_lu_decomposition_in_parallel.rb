module AdvancedMath
  class SLE
    class SolveByLUDecompositionInParallel
      attr_reader :matrix, :vector, :processors

      def initialize(matrix:, vector:, processors:)
        @matrix     = matrix
        @vector     = vector
        @processors = processors
      end

      def call
        decomposed_matrix = ConstructDecomposedMatrixInParallel.new(
          matrix: matrix,
          vector: vector,
          processors: processors
        ).call

        PerformBackSubstitution.new(
          decomposed_matrix: decomposed_matrix
        ).call
      end
    end
  end
end
