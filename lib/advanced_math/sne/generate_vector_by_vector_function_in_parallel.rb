module AdvancedMath
  class SNE
    class GenerateVectorByVectorFunctionInParallel
      attr_reader :vector_function, :vector, :processors

      def initialize(vector_function:, vector:, processors:)
        @vector_function = vector_function
        @vector          = vector
        @processors      = processors
      end

      def call
        sle_vector = Vector.new(size: vector_function.size)

        vector_function.size.times do |i|
          processors.each do |processor|
            processor.add_task do |row_indices|
              if row_indices.include?(i)
                sle_vector[i] = vector_function[i].call(vector)
              end
            end
          end

          processors.each(&:wait)
        end

        sle_vector
      end
    end
  end
end
