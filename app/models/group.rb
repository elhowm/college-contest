require_relative 'student'

class Group
  attr_accessor :name,
                :students

  def initialize(name, capacity)
    @students = []
    @name = name
    @capacity = capacity
    for a in 1..capacity do
      name = "name #{a}"
      surname = "surname #{a}"
      age = rand(17..24)
      student = Student.new(name, surname, age)
      @students.push(student)
    end
  end

  def info
    list = "      Group name: \"#{@name}\"\n\n"
    list += "      Students:\n"
    @students.sort! { |a, b|  a.name <=> b.name }
    .each { |student| list += "      - #{student.name}\n" }
    list
  end
end
