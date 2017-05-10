class Timer
  attr_reader :from, :to, :duration

  def initialize(&block)
    @from = Time.now

    block.call

    @to = Time.now
    @duration = to - from
  end

  def self.determine_duration(&block)
    Timer.new(&block).duration
  end
end
