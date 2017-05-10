require_relative 'vector/add_vector'
require_relative 'vector/subtract_vector'
require_relative 'vector/compute_norm'

module AdvancedMath
  class Vector
    attr_reader :elements

    def initialize(elements: nil, size: nil)
      @elements = initialize_elements(elements, size)
      @size     = size
    end

    def size
      @size ||= elements.size if elements
    end

    def [](index)
      elements[index]
    end

    def []=(index, element)
      elements[index] = element
    end

    def add_vector(vector)
      AddVector.new(first_vector: self, second_vector: vector).call
    end
    alias_method :+, :add_vector

    def subtract_vector(vector)
      SubtractVector.new(first_vector: self, second_vector: vector).call
    end
    alias_method :-, :subtract_vector

    def -@
      Vector.new(elements: elements.map { |element| -element })
    end

    def compute_norm
      ComputeNorm.new(vector: self).call
    end

    private
      def initialize_elements(elements, size)
        elements || generate_default_elements(size)
      end

      def generate_default_elements(size)
        Array.new(size) { nil }
      end
  end
end
