class Student
  attr_accessor :name,
                :surname,
                :age

  def initialize(name, surname, age)
    @name = name
    @surname = surname
    @age = age
  end

  def full_name
    "#{name} #{surname}"
  end
end
