require 'spec_helper'

describe Student do
    context 'With valid arguments' do
      it 'should return name of the person' do
        new_student = Student.new(nil, 21, 'Alfred', true)
        expect(new_student.name).to eq 'Alfred'
      end
    end
    
end
