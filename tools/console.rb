require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

###  WRITE YOUR TEST CODE HERE ###

require_relative './solution.rb'

# Creating sample authors
author1 = Author.new("Alice")
author2 = Author.new("Bob")
author3 = Author.new("Charlie")

# Creating sample magazines
magazine1 = Magazine.new("Tech Today", "Technology")
magazine2 = Magazine.new("Nature Journal", "Environment")
magazine3 = Magazine.new("Sci World", "Science")

# Adding articles to authors and magazines
author1.add_article(magazine1, "AI Revolution")
author1.add_article(magazine2, "Climate Change Impact")
author2.add_article(magazine1, "Blockchain Technology")
author2.add_article(magazine2, "Sustainable Energy")
author2.add_article(magazine3, "Quantum Computing")
author3.add_article(magazine3, "Mars Exploration")

# Test cases
puts "===== Author#name ====="
puts author1.name == "Alice"
puts author2.name == "Bob"

puts "===== Author#articles ====="
puts author1.articles.size == 2
puts author2.articles.size == 3

puts "===== Author#magazines ====="
puts author1.magazines.size == 2
puts author2.magazines.size == 3

puts "===== Author#topic_areas ====="
puts author1.topic_areas == ["Technology", "Environment"]
puts author2.topic_areas == ["Technology", "Environment", "Science"]

puts "===== Magazine#contributors ====="
puts magazine1.contributors.size == 2
puts magazine2.contributors.size == 2

puts "===== Magazine.find_by_name ====="
puts Magazine.find_by_name("Tech Today") == magazine1
puts Magazine.find_by_name("Nature Journal") == magazine2

puts "===== Magazine#article_titles ====="
puts magazine1.article_titles == ["AI Revolution", "Blockchain Technology"]
puts magazine2.article_titles == ["Climate Change Impact", "Sustainable Energy"]

puts "===== Magazine#contributing_authors ====="
puts magazine1.contributing_authors.empty?
puts magazine2.contributing_authors.empty?
