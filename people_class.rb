require './person'
require './student'
require './teacher'
require './classroom'

class People
  def self.list_all_people(list)
    puts 'There are no people yet! Kindly add a student or teacher.' if list.empty?
    list.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    sleep 0.65
  end

  def self.create_a_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp
    case option
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
  end

  def self.create_a_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    parent_permission = parent_permission == 'y'
    classone = Classroom.new('Grade 10')
    student = Student.new(age, classone, name, parent_permission: parent_permission)
    puts 'Student created successfully'
    sleep 0.75
    student
  end

  def self.create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)

    puts 'Teacher created successfully'
    sleep 0.65
    teacher
  end
end
