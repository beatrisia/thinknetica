alphabet = ("a".."z").to_a
vowels = ["a", "e", "i", "o", "u"]
hash = {}

alphabet.each_with_index { |letter, index| hash[letter] = index + 1 if vowels.include?(letter) }


=begin

alphabet = ("a".."z").to_a
vowels = alphabet.select { |vowel| vowel =~ /[aeiou]/ }.map.with_index { |value, index| [value, index + 1] }.to_h
puts vowels

=end
