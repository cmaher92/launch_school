# skip.rb

def skip_animals(animals, skip)
  not_skipped_animals = []
  animals.each_with_index do |animal, idx|
    not_skipped_animals << "#{idx}:#{animal}" if idx >= skip
  end
  not_skipped_animals
end

p skip_animals(['leopard', 'bear', 'fox', 'wolf'], 2)