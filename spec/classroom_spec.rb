require 'spec_helper'

describe 'Classroom' do
  it 'has a label' do
    classroom = Classroom.new('Grade 10')
    expect(classroom.label).to eq('Grade 10')
  end

  it 'has initialized student array' do
    classroom = Classroom.new('Grade 10')
    expect(classroom.students).to eq([])
  end
end
