module AdvancedMath
  class Matrix
    attr_reader :rows

    def initialize(rows: nil, row_size: nil, column_size: nil)
      @rows        = initialize_rows(rows, row_size)
      @row_size    = row_size
      @column_size = column_size
    end

    def row_size
      @row_size ||= rows.size if rows
    end

    def column_size
      @column_size ||= rows[0].size if rows
    end

    def valid?
      rows || row_size
    end

    def [](index)
      rows[index]
    end

    def []=(index, row)
      column_size.times do |j|
        rows[index][j] = row[j]
      end

      rows[index]
    end

    def swap_rows!(first_index, second_index)
      rows[first_index], rows[second_index] =
        rows[second_index].clone, rows[first_index].clone
    end

    def -@
      Matrix.new(rows: rows.map { |row| row.map { |element| -element } })
    end

    private
      def initialize_rows(rows, row_size)
        rows || generate_default_rows(row_size)
      end

      def generate_default_rows(row_size)
        if row_size
          Array.new(row_size) { [] }
        end
      end
  end
end
