def palindrome?(string)
  string.gsub!(/\W+/, "")
  string.downcase!
  string == string.reverse
end

def count_words(string)
  hash = Hash.new
  string.scan(/\b[\w]+\b/){|w| w = w.downcase;
  	hash.has_key?(w) ? hash[w]+=1 : hash[w]=1
  }
  hash
end