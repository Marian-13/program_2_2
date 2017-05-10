module AdvancedMath
  class ProcessorsFactory
    def self.create_processors(processors_amount:, matrix:)
      processors_row_indices =
        CyclicLayerScheme::GenerateProcessorsRowIndices.new(
          processors_amount: processors_amount,
          matrix: matrix
        ).call

      processors = Array.new(processors_amount)

      (0...processors_amount).each do |i|
        processors[i] = Processor.new(row_indices: processors_row_indices[i])
      end

      processors
    end

    private
      def initialize(*); end
  end
end
