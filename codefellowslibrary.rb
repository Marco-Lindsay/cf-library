#  Book class
class Book
  $books = 0

  def initialize(title, branch)
    @title = title
    @branch = branch
    $books += 1
  end

#  enshelf method to add a book to a shelf
  def enshelf(shelf)
    @shelf = shelf
    shelf.add(self)
    puts "Added #{@title} "
  end

#  unshelf method to remove a book from a shelf
  def unshelf
    @shelf.remove(self)
    puts "Removed #{@title} "
  end

  def self.total
    $books
  end
end

#   Shelf class

class Shelf
  $shelves = 0

  def initialize(branch)
    branch.new_shelf(self)
    @title = Array.new
    $shelves += 1
  end

  def remove(book)
    @title.delete(book)
    $books += -1
  end

  def add(book)
    @title.push(book)
  end

  def self.total
    $shelves
  end
end


#   Library class
class Library

  def initialize
    @shelf = Array.new
    @title = Array.new
  end

#   method to report all books the library contains
  def total
    if Book.total.to_i >= 2 or Book.total.to_i < 1
      puts "There are #{Book.total} books in the library."
    end
#    making it gramatically correct
    if Book.total.to_i == 1
      puts "There is #{Book.total} book in the library."
    end
  end

#   method to report all shelves the library contains
  def shelftotal
    if Shelf.total.to_i >= 2 or Shelf.total.to_i < 1
      puts "There are #{Shelf.total} shelves in the library."
    end
#    making it gramatically correct
    if Shelf.total.to_i == 1
      puts "There is #{Shelf.total} shelf in the library."
    end
  end

  def new_shelf(shelf)
    @shelf.push(self)
  end

end



#create a library or open a "branch"
Codefellows = Library.new
puts "Initiall count:"
#book total and shelf total both at zero initially
Codefellows.total
Codefellows.shelftotal
puts ""#blank line


#create shelves
Fiction = Shelf.new(Codefellows)
Nonfiction = Shelf.new(Codefellows)


puts "Count after adding shelves:"
#shelf total with new shelves created
Codefellows.shelftotal
puts ""#blank line


#create books
book1 = Book.new("East of Eden", Codefellows) #A really great book I highly recomend
puts "Count after adding a book:"
#add to shelf
book1.enshelf(Fiction)


#show the diff between one or more books in library
Codefellows.total
puts ""#blank line


#add another book
book2 = Book.new("The Pragmatic Programmer", Codefellows)


#book total with books created and added to shelves
puts "Count after adding multiple books:"
book2.enshelf(Nonfiction)
Codefellows.total
puts""


#remove books from the shelf and library
book1.unshelf
book2.unshelf
puts ""#blank line


#to show that books can be removed
puts "Count after removing books:"
Codefellows.total
