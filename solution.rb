# Please copy/paste all three classes into this file to submit your solution!
# Please copy/paste all three classes into this file to submit your solution!
class Author
    attr_reader :name
  
    def initialize(name)
      # An author is initialized with a name, as a string.
      # A name cannot be changed after it is initialized.
      @name = name
    end
  
    # Returns the name of the author
    def name
      @name
    end
  
    # Returns an array of Article instances the author has written
    def articles
      Article.all.select { |article| article.author == self }
    end
  
    # Returns a unique array of Magazine instances for which the author has contributed to
    def magazines
      articles.map(&:magazine).uniq
    end
  
    # Given a magazine (as Magazine instance) and a title (as a string),
    # creates a new Article instance and associates it with that author and that magazine.
    def add_article(magazine, title)
      Article.new(self, magazine, title)
    end
  
    # Returns a unique array of strings with the categories of the magazines the author has contributed to
    def topic_areas
      magazines.map(&:category).uniq
    end
  end
  
  class Magazine
    attr_accessor :name, :category
    @@all = []
  
    def initialize(name, category)
      # A magazine is initialized with a name as a string and a category as a string
      @name = name
      @category = category
      @@all << self
    end
  
    def self.all
      # Returns an array of all Magazine instances
      @@all
    end
  
    # Returns an array of Author instances who have written for this magazine
    def contributors
      articles = Article.all.select { |article| article.magazine == self }
      articles.map(&:author).uniq
    end
  
    # Given a string of magazine's name, this method returns the first magazine object that matches
    def self.find_by_name(name)
      all.find { |magazine| magazine.name == name }
    end
  
    # Returns an array strings of the titles of all articles written for that magazine
    def article_titles
      articles = Article.all.select { |article| article.magazine == self }
      articles.map(&:title)
    end
  
    # Returns an array of authors who have written more than 2 articles for the magazine
    def contributing_authors
      contributors.select { |author| author.articles.count { |article| article.magazine == self } > 2 }
    end
  end
  
  class Article
    attr_reader :author, :magazine, :title
    @@all = []
  
    def initialize(author, magazine, title)
      # An article is initialized with an author as an Author object,
      # a magazine as a Magazine object, and title as a string.
      @author = author
      @magazine = magazine
      @title = title
      @@all << self
    end
  
    def self.all
      # Returns an array of all Article instances
      @@all
    end
  end
  