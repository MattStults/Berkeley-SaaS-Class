def combine_anagrams words
  hash = Hash.new
  words.each do |word|
    key = word.downcase.chars.sort.join
    hash[key] = [] if hash[key] == nil
    hash[key] += [word]
  end
  hash.each {|key, value| value.uniq}
  return hash.values
end

