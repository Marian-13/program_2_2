module AdvancedMath
  class IterativeMethodResult # TODO Rather use OStruct?
    attr_reader :vector, :amount_of_iterations

    def initialize(vector:, amount_of_iterations:)
      @vector               = vector
      @amount_of_iterations = amount_of_iterations
    end
  end
end
