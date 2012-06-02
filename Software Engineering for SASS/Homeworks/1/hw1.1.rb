def palindrome?(string)
  string.gsub(/\W/, '').downcase == string.gsub(/\W/, '').downcase.reverse
end

def count_words(string)
  result = Hash.new(0)
  string.downcase.split(/\W+/).each { |word| result[word] += 1 }

  result
end
