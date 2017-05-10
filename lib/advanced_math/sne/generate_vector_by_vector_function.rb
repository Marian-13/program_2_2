module AdvancedMath
  class SNE
    class GenerateVectorByVectorFunction
      attr_reader :vector_function, :vector

      def initialize(vector_function:, vector:)
        @vector_function = vector_function
        @vector          = vector
      end

      def call
        sle_vector = Vector.new(size: vector_function.size)

        vector_function.size.times do |i|
          sle_vector[i] = vector_function[i].call(vector)
        end

        sle_vector
      end
    end
  end
end
