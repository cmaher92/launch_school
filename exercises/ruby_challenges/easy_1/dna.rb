class DNA
  def initialize(strand)
    @strand = strand.split(//)
  end

  def hamming_distance(other_strand)
    other_strand = other_strand.split(//)
    mutations = 0
    idx = 0
    loop do
      return mutations unless @strand[idx] && other_strand[idx]
      mutations += 1 if @strand[idx] != other_strand[idx]
      idx += 1
    end
  end
end
