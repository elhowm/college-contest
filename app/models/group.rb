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
    @students.sort_by { |student| [student.name] }
    .each { |student| list += "      - #{student.name}\n" }
    list
  end

  def search(sr)
    list = @students.sort_by { |student| [student.name, student.surname] }
                    .select { |e| e.name.include?(sr) }
    list = @students.sort_by { |student| [student.name, student.surname] }
                    .select { |e| e.name.include?(sr) or e.surname.include?(sr) or
                    "#{e.name} #{e.surname}".include?(sr) }
    list
  end

  def find(sr)
    search(sr).first
  end
end
