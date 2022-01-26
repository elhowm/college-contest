class Student
  attr_accessor :name,
                :surname,
                :age

  def initialize(name, surname, age)
    @name = name
    @surname = surname
    @age = age
  end

  def full_name(students)
    students.sort_by { |student| [student.name, student.surname] }
  end
end
