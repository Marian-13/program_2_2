module AdvancedMath
  class Vector
    class SubtractVector # TODO Inheritance or Mixin
      attr_reader :first_vector, :second_vector

      def initialize(first_vector:, second_vector:)
        @first_vector  = first_vector
        @second_vector = second_vector
      end

      def call
        result = Vector.new(size: first_vector.size)
        result.size.times { |i| result[i] = first_vector[i] - second_vector[i] }
        result
      end
    end
  end
end
