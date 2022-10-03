class CreateStudent
  def create_a_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(age, @class, name, parent_permission: parent_permission)
    @people << student
    puts 'Student created successfully'
    sleep 0.75
    menu
  end
end
