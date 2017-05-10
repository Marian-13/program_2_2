module AdvancedMath
  module CyclicLayerScheme
    class GenerateProcessorsRowIndices
      attr_reader :processors_amount, :matrix

      def initialize(processors_amount:, matrix:)
        @processors_amount = processors_amount
        @matrix            = matrix
      end

      def call
        amount_of_row_indices_per_processor =
          matrix.row_size / processors_amount

        processors_row_indices = Array.new(processors_amount) { [] }

        row_index = -1

        amount_of_row_indices_per_processor.times do |j|
          (0...processors_amount).each do |i|
            row_index += 1
            processors_row_indices[i][j] = row_index
          end
        end

        processors_row_indices
      end
    end
  end
end
