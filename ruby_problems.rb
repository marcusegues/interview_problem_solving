require 'byebug'
require 'benchmark'

def unique_chars(str)
  """
  Check if a string has all unique characters using bit shifting.
  n = str.len
  Time complexity: O(n)
  Space complexity: O(1)
  """
  checker = 0

  str.split("").each do |letter|
    shift = letter.ord - 'a'.ord
    return false if (checker & (1 << shift)) > 0
    checker |= (1 << shift)
  end
  return true
end

def is_permutation?(str1, str2)
  """
    Checks if a string is a permutation of the other using a hash to keep track
    of letter counts in each string
    Time complexity: O(n)
    Space complexity: O(n)
  """
  return false if str1.length != str2.length
  letter_counts = {}

  str1.split("").each do |letter|
    letter_counts[letter].nil? ? letter_counts[letter] = [1,0]
                               : letter_counts[letter][0] += 1
  end

  str2.split("").each do |letter|
    return false if letter_counts[letter].nil?
    letter_counts[letter][1] += 1
  end

  letter_counts.keys.each do |key|
    return false if letter_counts[key][0] != letter_counts[key][1]
  end

  true
end

def is_permutation1?(str1, str2)
  """
    Checks if a string is a permutation of the other using a hash to keep track
    of letter counts in each string.
    Time complexity: O(n)
    Space complexity: O(n)
  """
  return false if str1.length != str2.length
  # chars = Array.new(256) {0}
  chars = Hash.new {|h,k| h[k] = 0}

  str1.split("").each do |char|
    chars[char.ord] += 1
  end

  str2.split("").each do |char|
    return false if (chars[char.ord] -= 1) < 0
  end

  true
end

def is_permutation2?(str1, str2)
  """
  Checks if str1 is a permutation of str2 by sorting both strings and
  comparing the results for equality.
  Time complexity: O(nlgn)
  Space complexity: O(n)
  """
  str1sorted = str1.split("").sort
  str2sorted = str2.split("").sort

  return false unless str1sorted == str2sorted

  true
end

def replace_spaces(str)
  """
    Replaces each space in a string with string %20
  """
  idxs = []
  str.split("").each_with_index do |letter, i|
    idxs << i if letter == " "
  end

  new_str = ""
  prev = 0
  idxs.each do |i|
    new_str << str[prev...i] << "%20"
    prev = i + 1
  end
  new_str << str[prev..-1]
  new_str
end

def compress_string(str)
  """
    Basic string compression. Returns original string if compressed string
    is longer than the original. This is calculated using a variable called
    compression: if a letter is repeated zero times, then compression is
    incremented by 1; if a letter is repeated at least three times, then
    compression is decremented by two minus the number of repetitions. If at
    the end of checking each letter this variable is nonnegative, then the
    compressed string is at least as long as the original, so the original is
    returned.
    Important to use << operator for string concatenation, as this does not
    create a new string each time we want to concatenate.
    Time complexity: O(n)
    Space complexity: O(n)
  """
  compression = 0
  strarr = str.split ""
  compressedstr = ""
  i = 0
  while i < strarr.length
    count = 1
    letter = strarr[i]
    while i < str.length
      i += 1
      if strarr[i] != letter
        break;
      else
        count += 1
      end
    end
    if count > 2
      compression += 2 - count
    elsif count < 2
      compression += 1
    end
    compressedstr << letter << count.to_s
  end
  return str if compression >=0
  compressedstr
end

def zip(*arrays)
  lens = arrays.collect {|arr| arr.length}
  maxlen = lens.max

  zipped = []

  (0...maxlen).each do |i|
    subzip = []
    arrays.each {|arr| subzip << arr[i]}
    zipped << subzip
  end
  zipped
end

def sumArrayPairs(arr, value)
  seen = {}
  pairs = []

  arr.each_with_index do |el, i|
    target = value - el
    target_i = seen[target]
    if target_i
      pairs << [target_i, i]
    else
      seen[el] = i
    end
  end
  pairs
end

def move_zeros(arr)
  """
  O(n) time complexity
  O(1) space complexity
  maintains the initial ordering of the elements (excluding zeros)
  """
  i = 0
  offset = 0
  while (i < arr.length)
    if (i + offset >= arr.length)
      arr[i] = 0
      next
    else
      current = arr[i + offset]
      while (current == 0)
        offset += 1
        current = arr[i + offset]
      end
      arr[i] = current
    end
    i += 1
  end
  arr
end

def look_and_say(arr)
  """
  'Look and say' takes an input array and outputs an array
  that describes the count of the elements in the input array
  as they appear in order.
  ex: look_and_say([1, 2, 1, 1]) == [[1, 1], [1, 2], [2, 1]]
  """
  return [] if arr.empty?
  output = [[0, arr.first]]

  arr.each do |el|
    if el == output.last[1]
      output.last[0] += 1
    else
      output << [1, el]
    end
  end
  output
end

def missing_element(arr)
  """
  arr contains n unique elements from 0 to n
  there is one missing, find it
  O(n) time complexity because of the sum of the elements of the array
  O(1) space complexity
  """
  n = arr.length
  sum = n * (n + 1) / 2
  arr_sum = arr.inject(:+)

  sum - arr_sum
end

def hash_dictionary(dir_hash)
  file_paths = []

  dir_hash.each do |k,v|
    if v == true
      file_paths << k
    else
      file_paths.concat(hash_dictionary(v).map { |str| "#{k}/" + str })
    end
  end
  file_paths
end

def find_missing_number(arr1, arr2)
  """
  Assume an array of non-negative integers. A second array is formed
  by shuffling the elements of the first array and deleting a random
  element. Given these two arrays, find which element is missing in the
  second array.
  Time complexity: O(n)
  Space complexity: O(1)
  """
  arr1.inject(:+) - arr2.inject(:+)
end

def is_shuffle?(str1, str2, str3)
  """
  Given three strings, return whether the third is an interleaving of the
  first two. Interleaving means it only contains characters from the other
  two, no more no less, and preserves their character ordering.
  'abdecf' is an interleaving of 'abc' and 'def'. Note that the first two
  strings needn't be in alphabetical order like these.
  Assume that the first two strings do not contain any characters in common.
  Time complexity: O(n) where n is the length of the third string
  Space complexity: O(1)
  """
  return false unless str3.length == str1.length + str2.length
  i, j, k = 0, 0, 0
  while k < str3.length
    if str1[i] == str3[k]
      i += 1
    elsif str2[j] == str3[k]
      j += 1
    else
      return false
    end
    k += 1
  end
  true
end

def binary1(int)
  bin = ""
  factor = 2;
  while int > 0
    rem = int % factor
    rem > 0 ? bin << "1" : bin << "0";
    int -= rem
    factor *= 2
  end
  bin.reverse
end

def binary(int)
  bin = []
  while int > 0
    bin << int % 2
    int /= 2
  end
  bin.reverse.join
end

def subsets(arr)
  """
  Time complexity: O(2^n)
  Space complexity: O(2^n)
  """
  return [[]] if arr.empty?
  subs = subsets(arr[0..-2])
  subs.concat(subs.map { |el| el + [arr[-1]] })
end

def pseudo_substrings(str)
  """
  Generates all pseudo substrings using a call to subsets
  Iterates over each subset, mapping each subset to a pseudo substring
  Substrings have length n/2 on average, so a size O(n) iteration takes place for
  each of O(2^n) substrings
  Time complexity: O(n*2^n)
  Space complexity: O(2^n)
  """
  psub_idxs = subsets((0...str.length).to_a)
  psubs = []
  psub_idxs.each do |idx_list|
    psubs << idx_list.map { |idx| str[idx]}.join
  end
  psubs
end

def lexic_compare(str1, str2)
  str1.length.times do |i|
    next if str1[i] == str2[i]
    return 1 if str2[i].nil? || str1[i] > str2[i]
    return -1
  end
  return -1 if str2.length > str1.length
end

def lexic_greatest_psubs(str)
  """
  Given a string str, find the lexicographical greatest psubstring. This
  solution generates all psubstrings and picks the greatest
  Time complexity: O(n*2^n)
  Space complexity: O(2^n)
  """
  psubs = pseudo_substrings(str)
  psubs.sort { |str1, str2| lexic_compare(str1, str2) }.last
end

def lexic_greatest_psubs_faster(str)
  """
  Time complexity: O(n^2)
  Space complexity: O(n)
  """
  return "" if str.empty?
  greatest = 0
  str.split("").each_with_index do |letter,i|
    greatest = i if letter > str[greatest]
  end
  str[greatest] + lexic_greatest_psubs_fast(str[greatest+1..-1])
end

def lexic_greatest_psubs_fastest(str)
  """
  Time complexity: O(n)
  Space complexity: O(n)
  """
  psub = [str[-1]]

  (str.length - 2).downto(0) do |i|
    psub << str[i] if str[i] > psub.last  # O(1) amortized
  end

  psub.reverse.join
end




def compare_algorithms
  n = 1000
  Benchmark.bmbm do |x|
    x.report("check1: ") { n.times do ; is_permutation?("marcusramonamariamariana", "margunramotamhriamariana"); end }
    x.report("check2: ") { n.times do ; is_permutation1?("marcusramonamariamariana", "margunramotamhriamariana"); end }
    x.report("check3: ") { n.times do ; is_permutation2?("marcusramonamariamariana", "margunramotamhriamariana"); end }
  end
end
