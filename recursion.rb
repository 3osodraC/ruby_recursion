# Normal methods to be converted to recursion methods
class Normal
  # Fibonacci sequence.
  def fibs(seq_size)
    i = 0
    fibs = []

    while seq_size != i
      if i.zero?
        fibs << 0
        i += 1
        next
      elsif i == 1
        fibs << 1
        i += 1
        next
      end

      fibs.push(fibs[-1] + fibs[-2])
      i += 1
    end
    p fibs
  end
end

# Recursion methods in ruby.
class Recursion
  def fibs_rec(int)
    return [0, 1] if int <= 2

    fibs = fibs_rec(int - 1)
    fibs.push(fibs[-1] + fibs[-2])
  end
end

normal = Normal.new
recursion = Recursion.new
# recursion = Recursion.new

puts 'Fibonacci Sequence (non-recursive, 16 terms):'
normal.fibs(16)
puts 'Fibonacci Sequence (recursive, 16 terms):'
p recursion.fibs_rec(16)
