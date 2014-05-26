module FunWithStrings


  def palindrome?
    self.downcase.gsub(/\W/,"").reverse.eql? self.downcase.gsub(/\W/,"")
  end


  def count_words
    hash = Hash.new(0)
    self.split.each do |word|
      str = word.downcase.gsub(/\W/,"")
      if str.match(/^\w+/)
        hash[str] += 1
      end
    end
    return hash
  end

  def anagram?(str)
    if self != "" && str != "" && str && self
      return self.downcase.chars.sort.join.eql? str.downcase.chars.sort.join
    else
      return false
    end
  end


  def anagram_groups 

    words = self.split
    anagr_hasht = Hash.new() # create hash table to keep anagrams

    words.length.times do
      str1 = words.shift
      if str1 != ""
        elt = anagr_hasht.find { |k,v| str1.anagram?(k) }
        if elt == nil
          anagr_hasht.store(str1, Array.new(1,str1))
        else
          anagr_hasht[elt[0]] << str1
        end
      end
    end

    anagrams = Array.new()
    anagr_hasht.each do |k,v|
      anagrams << v
    end
    return anagrams
  end


end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

puts ''.anagram_groups
puts "star Arts sTar start artst".anagram_groups
puts "scream cars for four scar creams".anagram_groups



#puts "adam".palindrome?

#puts 'redi vi"der'.palindrome?

#puts "   to Be or not to 'BE".count_words

#puts "".count_words

#puts "a man, a plan, a canal -- Panama!".count_words
