require_relative 'student'

class Group
  attr_accessor :name,
                :students

  def initialize(name, capacity)
    @students = []
    @name = name
    capacity.times do |number|
      name = "name #{number}"
      surname = "surname #{number}"
      age = rand(17..24)
      @student = Student.new(name, surname, age)
      @students.push(@student)
    end
  end

  def info
    list = "      Group name: \"#{@name}\"\n\n"
    list += "      Students:\n"
    students = @student.full_name(@students)
    .each { |student| list += "      - #{student.name}\n" }
    list
  end

  def search(sr)
    list = @student.full_name(@students)
    .select { |e| e.name.include?(sr) }
    list = @student.full_name(@students)
    .select { |e| e.name.include?(sr) or e.surname.include?(sr) or
        "#{e.name} #{e.surname}".include?(sr) }
    list
  end

  def find(sr)
    search(sr).first
  end
end
