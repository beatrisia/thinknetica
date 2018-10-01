alphabet = ("a".."z").to_a
vowels = alphabet.select { |vowel| vowel =~ /[aeiou]/ }.map.with_index { |value, index| [value, index + 1] }.to_h
puts vowels
