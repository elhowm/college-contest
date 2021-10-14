require_relative 'student'

class Group
  attr_accessor :students

  def initialize(capacity)
    @students = []
    for a in 1..capacity do
      surname = "surname " + a.to_s
      name = "name " + a.to_s
      age = rand(17..24)
      student = Student.new(name, surname, age)
      @students.push(student)
    end
  end
end
