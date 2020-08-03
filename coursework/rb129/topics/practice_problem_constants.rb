require 'pry'

module A
  module B
  end

  module C
    module D
      B
      # what is the order in which Ruby looks for the B module?
      # what method can you invoke to confirm this?
    end
  end
end

# Answer
# - First look in A::C::D
# - Then will look in A::C
# - Finally A
# - Module.nesting
