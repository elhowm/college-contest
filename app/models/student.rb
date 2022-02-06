require_relative 'book'

class Student
  attr_accessor :name,
                :surname,
                :age,
                :memory

  def initialize(name, surname, age, memory)
    @name = name
    @surname = surname
    @age = age
    @memory = memory
  end

  def full_name
    "#{name} #{surname}"
  end

  def read_book(book)
    memory.push(book)
  end

  def forget_book(id)
    memory.delete_if { |book| book.id == id }
  end

  def examinate(search)
    memory.each do |book|
       return book if book.text.include? search
    end
    return nil
  end
end
