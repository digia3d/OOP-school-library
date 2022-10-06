require 'spec_helper'

describe Student do
    context 'With valid arguments' do
      it 'should return name of the person' do
        new_student = Student.new(nil, 21, 'Alfred', true)
        expect(new_student.name).to eq 'Alfred'
      end
      it 'Add a student to a specific class' do
        new_student = Student.new(nil, 21, 'Alfred', true)
        new_classromm = Classroom.new('Computer science')
        new_student.classroom =new_classromm
        expect(new_student.classroom).to eq new_classromm
      end
    end
    
end
