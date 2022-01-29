require_relative 'student'

class Group
  attr_accessor :name,
                :students

  def initialize(name, capacity)
    @students = []
    @name = name
    @capacity = capacity
    capacity.times do |number|
      name = "name #{number}"
      surname = "surname #{number}"
      age = rand(17..24)
      student = Student.new(name, surname, age)
      @students.push(student)
    end
  end

  def info
    list = "      Group name: \"#{@name}\"\n\n"
    list += "      Students:\n"
    students.sort_by(&:full_name)
    .each { |student| list += "      - #{student.name}\n" }
    list
  end

  def search(sr)
    list = students.sort_by(&:full_name)
                   .select { |student| student.name.include?(sr) }
    list = students.sort_by(&:full_name)
                   .select { |student| student.name.include?(sr) or
                   student.surname.include?(sr) or student.full_name.include?(sr) }
    list
  end

  def find(sr)
    search(sr).first
  end
end
