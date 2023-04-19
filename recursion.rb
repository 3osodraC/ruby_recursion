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

  # on array arr
  #   if n < 2
  # else
  #   sort left half
  #   sort right half
  #   merge
  def merge_sort(arr)
    if arr.size < 2
      arr
    else
      # Splits the array in two.
      arr_l = []
      arr_r = []
      half = (arr.size / 2).ceil
      arr.each_slice(half) { |slice| arr_l.empty? ? arr_l = slice : arr_r = slice }

      # Recursion commenced.
      arr_l_rec = merge_sort(arr_l)
      arr_r_rec = merge_sort(arr_r)

      sorted = []
      # Returns sorted array if they're both of size 1,
      # the loop below 'else' is not capable of this
      if arr_l_rec.size == 1 && arr_r_rec.size == 1
        sorted << if arr_l_rec[0] < arr_r_rec[0]
                    [arr_l_rec[0], arr_r_rec[0]]
                  else
                    [arr_r_rec[0], arr_l_rec[0]]
                  end
      else
        # Sorts the arrays by combining them with zip and sorting them. This saves a few lines
        arr_l_rec.zip(arr_r_rec).each_with_index do |(l, r), index|
          sorted << if l < r
                      l
                    else
                      r
                    end
        end
      end
      sorted.flatten
    end
  end
end

normal = Normal.new
recursion = Recursion.new

puts 'Fibonacci Sequence (non-recursive, 16 terms):'
normal.fibs(16)
puts 'Fibonacci Sequence (recursive, 16 terms):'
p recursion.fibs_rec(16)
puts 'Merge Sort [353, 526, 907, 31, 783, 933, 120, 680]:'
p recursion.merge_sort([353, 526, 907, 31, 783, 933, 120, 680])
# should be 31, 120, 353, 526, 680, 783, 907, 933
