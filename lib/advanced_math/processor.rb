module AdvancedMath
  class Processor
    attr_reader :row_indices

    def initialize(row_indices:)
      @row_indices = row_indices
    end

    def add_task(&block)
      @thread = Thread.new { block.call(row_indices) }
    end

    def wait
      @thread.join
    end

    def join
      @thread.join
    end
  end
end
