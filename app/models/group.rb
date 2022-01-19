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
    @name = "      Group name: \"#{@name}\"\n\n"
    list = "#{@name}"
    list += "      Students:\n"
    i = 2
    while i > -1
      list += "      - #{@students[i].name}\n"
      i -= 1
    end
    return list
  end
end
