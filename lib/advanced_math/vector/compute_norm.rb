module AdvancedMath
  class Vector
    class ComputeNorm
      attr_reader :vector

      def initialize(vector:)
        @vector = vector
      end

      def call
        sum = vector.elements.reduce(0.0) { |sum, element| sum += element**2 }
        Math.sqrt(sum)
      end
    end
  end
end
