require './lib/advanced_math'
require './lib/timer'

include AdvancedMath

size = 4

matrix_function = Matrix.new(row_size: size, column_size: size)
matrix_function.row_size.times do |i|
  matrix_function.column_size.times do |j|
    matrix_function[i][j] =
      if i == j
        ->(x) { 2 * (x[i] - (i + 1)) }
      else
        ->(x) { 0.0 }
      end
  end
end

vector_function = Vector.new(size: size)
vector_function.size.times do |i|
  vector_function[i] = ->(x) { (x[i] - (i + 1))**2 }
end

initial_vector = Vector.new(elements: Array.new(size) { size + 1.0 })
epsilon = 0.001
processors_amount = 2

sne = SNE.new(
  vector_function: vector_function,
  matrix_function: matrix_function
)

sequential_method_result = nil
parallel_method_result   = nil

sequential_method_duration = Timer.determine_duration do
  sequential_method_result = sne.solve_by_newton_method(
    initial_vector: initial_vector,
    epsilon: epsilon
  )
end

parallel_method_duration = Timer.determine_duration do
  parallel_method_result = sne.solve_by_newton_method_in_parallel(
    initial_vector: initial_vector,
    epsilon: epsilon,
    processors_amount: processors_amount
  )
end

puts "Sequential Newton method duration = #{sequential_method_duration}"
puts "Parallel   Newton method duration = #{parallel_method_duration}"

puts "Sequential Newton method amount of iterations = #{sequential_method_result.amount_of_iterations}"
puts "Parallel   Newton method amount of iterations = #{parallel_method_result.amount_of_iterations}"

# puts "Sequential Newton method result = #{sequential_method_result.vector.inspect}"
# puts "Parallel   Newton method result = #{parallel_method_result.vector.inspect}"
