class CartesianProduct
  include Enumerable

  def initialize(sequence_a, sequence_b)
    @sequence_a = sequence_a
    @sequence_b = sequence_b
  end

  def each(&block)
    @sequence_a.each do |item_a|
      @sequence_b.each do |item_b|
        yield [item_a, item_b]
      end
    end
  end
end
